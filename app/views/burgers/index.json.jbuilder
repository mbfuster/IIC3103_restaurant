json.array! @burgers.each do |b|
  json.partial! 'burger', burger: b
end
