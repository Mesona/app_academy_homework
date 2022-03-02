# json.array! @guests, :name, :favorite_color, :age 
# json.extract! @guest, :name, :favorite_color, :age

# json.guests do |guest|
#   json.extract! guest, :name, :favorite_color, :age
# end
if @guests
  json.array! guests do |guest|
    json.name guest.name
    json.favorite_color guest.favorite_color
    json.age guest.age 
  end
elsif @guest
  json.extract! guest, :name, :favorite_color, :age
end