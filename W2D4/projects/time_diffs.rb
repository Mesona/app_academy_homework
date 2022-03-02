
def my_min_phase_one(array)
    array.each do |el1|
        min = true
        array.each do |el2|
            if el1 > el2
                min = false
            end
        end
        return el1 if min == true
    end
end

def my_min_phase_two(array)
    min = array.first
    array.each do |el|
        min = el if el < min
    end

    min
end

def largest_contiguous_sub_sum_phase_one(array)
    solutions = []

    array.each_index do |idx1|
        array.each_index do |idx2|
            solutions << array[idx1..idx2]
        end
    end

    solutions.delete([])
    p solutions 
    solutions.map! do |arr|
        arr.reduce(:+)
    end


    solutions.max

end

def largest_contiguous_sub_sum_phase_two(array)
    max = array[0]
    curr = 0

    array.each do |el|
       if curr + el > el 
        curr += el 
       else
        curr = el 
       end
       if curr > max 
        max = curr 
       end
    end
    max 
    
end