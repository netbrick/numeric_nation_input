require 'active_record'

module NumericNationInput
  # Create config
  def self.config
    {
      separator: ',',
      delimeter: ' '
    }
  end

  # Normalize number
  def self.normalize(number, replace_pattern)
    replace_pattern.each do |k, v|
      number.gsub!(k, v)
    end

    number
  end
end

class ActiveRecord::Base
  def self.numeric_nation_input(*args)
    # Get options
    options = NumericNationInput.config.merge args.extract_options!

    # Prepare replace pattern
    replace_pattern = { options[:delimeter] => '', options[:separator] => '.' }


    # All fields
    args.each do |field|
      define_method("#{field}=") do |value|
        self[field] = value.is_a?(String) ? NumericNationInput.normalize(value, replace_pattern) : value
      end
    end
  end
end
