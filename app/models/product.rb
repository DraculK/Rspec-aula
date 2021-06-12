class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  validates_length_of :name, minimum: 3
  validates_length_of :description, minimum: 10
  validates :price, numericality: true
  belongs_to :category
end
