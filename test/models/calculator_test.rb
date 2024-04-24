require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
  test "add should return 0 for an empty string" do
    assert_equal 0, Calculator.add("")
  end

  test "add should return number for a single no. string" do
    assert_equal 1, Calculator.add("1")
  end

  test "add should return the sum for comma-separated strings" do
    assert_equal 6, Calculator.add("1,5")
  end

  test "add method should return correct sum" do
    assert_equal 0, Calculator.add("")
    assert_equal 1, Calculator.add("1")
    assert_equal 3, Calculator.add("//;\n1;2")
    assert_equal 6, Calculator.add("1,2,3")
  end

  test "add method should raise exception for negative numbers" do
    assert_raises(RuntimeError) { Calculator.add("1,-2,3") }
    assert_raises(RuntimeError) { Calculator.add("//|\n1|2|-3") }
  end

end
