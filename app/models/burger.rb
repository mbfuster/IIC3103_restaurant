class Burger < ApplicationRecord
  has_many :ingredient_on_burgers
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_many :ingredients, through: :ingredient_on_burgers
end
