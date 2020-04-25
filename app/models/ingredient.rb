class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :ingredient_on_burgers
  has_many :burgers, through: :ingredient_on_burgers
end
