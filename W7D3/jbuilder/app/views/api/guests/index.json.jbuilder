# json.array! @guests, :name, :favorite_color, :age 

# json.array! @guests do |guest|
#   json.name guest.name
#   json.favorite_color guest.favorite_color
#   json.age guest.age 
# end

json.partial! 'api/guests/guest', guests: @guests