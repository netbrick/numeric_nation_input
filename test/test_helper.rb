require 'bundler/setup'
require 'minitest/autorun'
require 'numeric_nation_input'

require 'coveralls'
Coveralls.wear!

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'test/test.sqlite3'

ActiveRecord::Migration.create_table :test_models do |t|
  t.float :number
  t.float :price
  t.float :test_price
end rescue nil # poor's man schema

class TestModel < ::ActiveRecord::Base
  numeric_nation_input :number, separator: ',', delimeter: ' ' # 1 000,23
  numeric_nation_input :price,  separator: '.', delimeter: ',' # 1,2302,1030.20
  numeric_nation_input :test_price
  validates :number, :price, :test_price, numericality: true
end
