json.id @burger.id
json.nombre @burger.name
json.precio @burger.price
json.descripcion @burger.description
json.ingredientes @burger.ingredients.each do |ing|
  json.path ingredient_url(ing)
end
