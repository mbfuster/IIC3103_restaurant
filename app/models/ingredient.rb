class Ingredient < ApplicationRecord
  has_many :ingredient_on_burgers
  has_many :burgers, through: :ingredient_on_burgers
end
