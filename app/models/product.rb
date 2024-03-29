class Product < ApplicationRecord
  has_one_attached :photo

  validates :name, :price, :quantity, presence: true
  validates :name, format: { with: /\A[\w\s]+\z/,
        message: "should be a string or a combination
        of a string and a number" }
end
