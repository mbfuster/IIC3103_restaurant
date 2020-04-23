class CreateIngredientOnBurgers < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_on_burgers do |t|
      t.references :burger, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
