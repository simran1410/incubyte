class Calculator < ApplicationRecord
  # 1st Question
  def self.add(num)
    return 0 if num.blank?

    # num.split(",").map(&:to_i).sum

    # 3rd Question
    # Split the input string by both commas and new lines
    # num.split(/[\n,]/).map(&:to_i).sum

    # 4th Question
    delimiter = ","
    if num.start_with?("//")
      delimiter = num[2]
      num = num.split("\n", 2)[1]
    end

    num.split(/[\n#{delimiter}]/).map(&:to_i).sum
  end

  # 2nd Question
  # you can test this by using rails console
  # Calculator.add("")      o/p: 0
  # Calculator.add("1")     o/p: 1
  # Calculator.add("3,4")   o/p: 7
  # Calculator.add("3,4,4") o/p: 11

  # 3rd Question result
  # Calculator.add("1\n4,3") o/p: 8

  # 4th Question
  # Calculator.add("//;\n1;2")    o/p: 3
end
