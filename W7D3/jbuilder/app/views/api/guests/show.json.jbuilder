# json.extract! @guest, :name, :favorite_color, :age

json.partial! 'api/guests/guest', guest: @guest

json.gifts do
  json.array! @guest.gifts, :title, :description
end

puts json.gifts 