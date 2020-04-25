# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
burger = Burger.create(name: "BeleNifica", price: 6000, description: "McNifica de Belen", image: "")
i1 = Ingredient.create(name: "Lechuga", description: "Cosa verde")
i2 = Ingredient.create(name: "Cebolla", description: "Cosa blanca")
IngredientOnBurger.create(ingredient_id: i1.id, burger_id: burger.id)
IngredientOnBurger.create(ingredient_id: i2.id, burger_id: burger.id)
