module NumericNationInput
end

class ActiveRecord::Base
  def self.numeric_nation_input(*args)
    # Validation mechanism
    self.class_eval <<-EOS, __FILE__, __LINE__ + 1
      validate :numeric_nation_input_validation

      def numeric_nation_input_validation
        [ #{args.map { |m| ":#{m}" }.join(', ')} ].each do |val|
          errors.add( val, "\#{I18n.t("activerecord.attributes.\#{self.class.name.underscore}.\#{val.to_s}")} \#{I18n.t("activerecord.errors.messages.not_a_number")}" ) if read_attribute(val).nil?
        end
      end
    EOS

    args.each do |field|
      self.class_eval <<-EOS, __FILE__, __LINE__ + 1
        def #{field.to_s}=(s)
          # Parse number
          num = s.gsub(' ', '').gsub(',', '.')

          # Is number?
          if num.is_number?
            write_attribute(:#{field}, s.gsub(' ', '').gsub(',', '.'))
          else
            write_attribute(:#{field}, nil)
          end
        end
      EOS
    end
  end
end

class String
  def is_number?
    true if Float(self) rescue false
  end
end
