class Merchant < ApplicationRecord
  validates_presence_of :name

  scope :find_by_name, lambda { |name, value| where("lower(#{name}) = ?", value.downcase.gsub("_", " ")).first }
end
