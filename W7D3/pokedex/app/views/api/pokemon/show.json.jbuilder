# json.merge! @pokemon.attributes
# json.merge! @pokemon.items
# json.pokemon do 
#   json.name pokemon.name 
#   json.items pokemon.items 
# end 

# json.set! pokemon.id do
#   json.extract! pokemon, :name, :items
# end


# json.merge! @pokemon.attributes

# json.items do
#   json.name items.name
# end

# json.items do
#   json.array! @pokemon.items
# end

json.set! 'pokemon' do
  json.merge! @pokemon.attributes
end

json.set! 'items' do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
    end
  end
end

# json.extract! @pokemon.items

# json.items do |item|
#   json.name item.name
# end