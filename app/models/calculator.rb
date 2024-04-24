class Calculator < ApplicationRecord
  # 1st Question Create a simple String calculator with a method signature

  # def self.add(num)
  #   return 0 if num.blank?

  #   num.split(",").map(&:to_i).sum
  # end

  #2nd Question Allow the Add method to handle an unknown amount of numbers

  # you can test this by using rails console
  # Calculator.add("")      o/p: 0
  # Calculator.add("1")     o/p: 1
  # Calculator.add("3,4")   o/p: 7
  # Calculator.add("3,4,4") o/p: 11

  # 3rd Question Allow the Add method to handle new lines between numbers

  # def self.add(num)
  #   return 0 if num.blank?

  #   # Split the input string by both commas and new lines
  #   num.split(/[\n,]/).map(&:to_i).sum
  # end

  # 3rd Question result
  # Calculator.add("1\n4,3") o/p: 8

  # 4th Question Support different delimiters

  # def self.add(num)
  #   return 0 if num.blank?

  #   delimiter = ","
  #   if num.start_with?("//")
  #     delimiter = num[2]
  #     num = num.split("\n", 2)[1]
  #   end

  #   num.split(/[\n#{delimiter}]/).map(&:to_i).sum
  # end

  # 4th Question result
  # Calculator.add("//;\n1;2")    o/p: 3

  # 5th Question Calling add with a negative number will throw an exception

  # def self.add(num)
  #   return 0 if num.blank?

  #   delimiter = ","
  #   if num.start_with?("//")
  #     delimiter = num[2]
  #     num = num.split("\n", 2)[1]
  #   end

  #   num_arr = num.split(/[\n#{delimiter}]/).map(&:to_i)
  #   negative_num = num_arr.select { |num| num < 0 }

  #   if negative_num.any?
  #     raise "negative numbers not allowed #{negative_num.join(",")}"
  #   end

  #   num_arr.sum
  # end

  # 5th Question result
  # Calculator.add("-1,1,-8")    o/p: RuntimeError (negative numbers not allowed -1,-8)

  # 6th Question Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2

  # def self.add(num)
  #   return 0 if num.blank?

  #   delimiter = ","
  #   if num.start_with?("//")
  #     delimiter = num[2]
  #     num = num.split("\n", 2)[1]
  #   end

  #   numbers_arr = num.split(/[\n#{delimiter}]/).map(&:to_i)

  #   # Ignore numbers larger than 1000
  #   numbers_arr.reject! { |num| num > 1000 }

  #   numbers_arr.sum
  # end

  # 6th Question result
  # Calculator.add("2,1002")   o/p: 2


  # 7th Question Delimiters can be of any length

  # def self.add(num)
  #   return 0 if num.blank?

  #   delimiter = ","
  #   if num.start_with?("//")
  #     delimiters = num.match(/\/\/\[(.+?)\]\n/)
  #     delimiter = delimiters[1] if delimiters
  #     num = num.split("\n", 2)[1]
  #   end

  #   numbers_arr = num.split(/[\n#{Regexp.escape(delimiter)}]/).map(&:to_i)
  #   numbers_arr.reject! { |num| num > 1000 } # Ignore numbers larger than 1000
  #   numbers_arr.sum
  # end

  # 7th Question result
  # Calculator.add("//[***]\n1***2***3")  o/p: 6

  # 8th Question Allow multiple delimiters

  # def self.add(numbers)
  #   return 0 if numbers.blank?

  #   delimiters = []
  #   if numbers.start_with?("//")
  #     delimiters = numbers.scan(/\[(.*?)\]/).flatten
  #     numbers = numbers.split("\n", 2)[1]
  #   end

  #   delimiters_pattern = delimiters.map { |delimiter| Regexp.escape(delimiter) }.join("|")
  #   numbers_arr = numbers.split(/[\n#{delimiters_pattern}]/).map(&:to_i)

  #   negative_num = numbers_arr.select { |num| num < 0 }

  #   if negative_num.any?
  #     raise "negative numbers not allowed #{negative_num.join(",")}"
  #   end

  #   numbers_arr.reject! { |num| num > 1000 }

  #   numbers_arr.sum
  # end

  # 8th Question result
  # Calculator.add("//[;][#][$]\n1;2#3$4") o/p: 10

  # 9th Question make sure you can also handle multiple delimiters with length longer than one char

  def self.add(num)
    return 0 if num.blank?

    delimiters = []
    if num.start_with?("//")
      delimiters = num.scan(/\[(.*?)\]/).flatten
      num = num.split("\n", 2)[1]
    end

    delimiters_pattern = delimiters.map { |delimiter| Regexp.escape(delimiter) }.join("|")
    numbers_arr = num.split(/[\n#{delimiters_pattern}]/).map(&:to_i)

    numbers_arr.sum
  end

  # 9th Question result

  # Calculator.add("//[;;;][###][$]\n1;;;2###3$4") o/p: 10


end
