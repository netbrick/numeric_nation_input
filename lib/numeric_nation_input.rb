require 'active_record'

module NumericNationInput
  def self.normalize(number)
    number.gsub(',', '.')
  end
end

class ActiveRecord::Base
  def self.numeric_nation_input(*fields)
    fields.each do |field|
      define_method("#{field}=") do |value|
        self[field] = value.is_a?(String) ? NumericNationInput.normalize(value) : value
      end
    end
  end
end
