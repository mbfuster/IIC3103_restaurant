class Burger < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_many :ingredient_on_burgers
  has_many :ingredients, through: :ingredient_on_burgers
end
