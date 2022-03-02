if @gifts
json.array! @gifts, :title, :description 
elsif @gift 
json.extract! @gift, :title, :description
end 