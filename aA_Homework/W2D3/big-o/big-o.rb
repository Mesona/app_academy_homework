

def sluggish_octopus(array)
  longest = ""
  array.each do |fish1|
    array.each do |fish2|
      longest = fish1 if fish1.length > fish2.length
    end
  end

  puts longest
end

def dominant_octopus(array)
end

def clever_octopus(array)
  longest = ""
  array.each do |fish|
    longest = fish if fish.length > longest.length
  end

  puts longest
end

def slow_dance(direction, array)
  array.each_index do |idx|
    puts idx if array[idx] == direction
    return idx if array[idx] == direction
  end
end


def constant_dance(direction, hash)
  puts hash[direction]
  hash[direction]
end
  

if __FILE__ == $PROGRAM_NAME
fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

sluggish_octopus(fishies)
clever_octopus(fishies)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = Hash.new(0)
tiles_array.each_with_index {|el, idx| tiles_hash[el] = idx}
slow_dance("right-down", tiles_array)
constant_dance("left-down", tiles_hash)



end