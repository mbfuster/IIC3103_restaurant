class IngredientOnBurger < ApplicationRecord
  validates_uniqueness_of :ingredient_id, scope: :burger_id
  belongs_to :burger
  belongs_to :ingredient
end
