json.array! @ingredients.each do |i|
  json.partial! 'ingredient', ingredient: i
end
