require 'bundler/setup'
require 'minitest/autorun'
require 'numeric_nation_input'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'test/test.sqlite3'

ActiveRecord::Migration.create_table :test_models do |t|
  t.float :number
end rescue nil # poor's man schema

class TestModel < ::ActiveRecord::Base
  numeric_nation_input :number
  validates :number, numericality: true
end
