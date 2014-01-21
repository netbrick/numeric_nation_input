require 'test_helper'

class NumericNationInputTest < Minitest::Test
  def setup
    @model = TestModel.new
  end

  def test_valid_model_numericality
    @model.number = "1,5"
    assert @model.valid?
  end

  def test_invalid_model_numericality
    @model.number = "not a number"
    refute @model.valid?
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
end
