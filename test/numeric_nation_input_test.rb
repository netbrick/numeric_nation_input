require 'test/unit'
require 'active_record'
require File.expand_path(File.dirname(__FILE__) + '/../lib/numeric_nation_input')

DB_FILE = 'tmp/test_db'

FileUtils.mkdir_p File.dirname(DB_FILE)
FileUtils.rm_f DB_FILE

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => DB_FILE

class NumericNationInputTest < Test::Unit::TestCase
end
