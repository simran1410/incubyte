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
      # delimiter = num[2]
      delimiters = num.match(/\/\/\[(.+?)\]\n/)
      delimiter = delimiters[1] if delimiters
      num = num.split("\n", 2)[1]
    end

    # num_arr = num.split(/[\n#{delimiter}]/).map(&:to_i)

    # 7th Question
    num_arr = num.split(/[\n#{Regexp.escape(delimiter)}]/).map(&:to_i)

    # 5th Question
    negative_num = num_arr.select { |n| n < 0 }

    if negative_num.any?
      raise "negative numbers not allowed #{negative_num.join(",")}"
    end

    # 6th Question
    num_arr.reject! { |num| num > 1000 }

    num_arr.sum
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

  #5th Question
  # Calculator.add("-1,1,-8")    o/p: RuntimeError (negative numbers not allowed -1,-8)

  #6th Question
  # Calculator.add("2,1002")   o/p: 2

  # 7th Question
  # Calculator.add("//[***]\n1***2***3")  o/p: 6
end
