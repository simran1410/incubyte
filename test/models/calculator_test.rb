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
end
