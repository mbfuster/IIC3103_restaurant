class IngredientOnBurger < ApplicationRecord
  belongs_to :burger
  belongs_to :ingredient
end
