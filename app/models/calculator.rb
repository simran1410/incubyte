class Calculator < ApplicationRecord
  def self.add(num)
    return 0 if num.blank?
    num.split(",").map(&:to_i).sum
  end
end
