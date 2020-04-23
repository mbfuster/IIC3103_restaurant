class Burger < ApplicationRecord
  has_many :ingredient_on_burgers
  has_many :ingredients, through: :ingredient_on_burgers
end
