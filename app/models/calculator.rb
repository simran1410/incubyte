class Calculator < ApplicationRecord
  # 1st Question
  def self.add(num)
    return 0 if num.blank?

    # num.split(",").map(&:to_i).sum

    # 3rd Question
    # Split the input string by both commas and new lines
    num.split(/[\n,]/).map(&:to_i).sum
  end

  # 2nd Question
  # you can test this by using rails console
  # Calculator.add("")      o/p: 0
  # Calculator.add("1")     o/p: 1
  # Calculator.add("3,4")   o/p: 7
  # Calculator.add("3,4,4") o/p: 11

  # 3rd Question result
  # Calculator.add("1\n4,3") o/p: 8

end
