require 'test_helper'

class NumericNationInputTest < Minitest::Test
  def setup
    @model = TestModel.new
  end

  def test_valid_model_numericality
    @model.number = "1,5"
    assert !@model.errors[:number].any?
  end

  def test_invalid_model_numericality
    @model.number = "not a number"
    refute @model.errors[:number].any?
  end

  def test_constructor_is_typecasting
    @model = TestModel.new(number: "1,5")
    assert_equal 1.5, @model.number
  end

  def test_casting_of_comma_to_number
    @model.number = "1,5"
    assert_equal 1.5, @model.number
  end

  def test_casting_of_point_to_number
    @model.number = "1.5"
    assert_equal 1.5, @model.number
  end

  def test_casting_of_number_to_number
    @model.number = 1.5
    assert_equal 1.5, @model.number
  end

  def test_accepts_number_with_spaces
    @model.number = "1 230,30"
    assert_equal 1230.3, @model.number
  end

  def test_specified_delimeter
    @model.price = "12,202,301"
    assert_equal 12202301, @model.price
  end

  def test_specified_separator
    @model.price = "123.23"
    assert_equal 123.23, @model.price
  end

  def test_specified_separator_and_delimeter
    @model.price = "123,456.789"
    assert_equal 123456.789, @model.price
  end

  def test_default_settings
    @model.test_price = "1 032,20"
    assert_equal 1032.2, @model.test_price
  end
end
