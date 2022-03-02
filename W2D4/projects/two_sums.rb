require 'byebug'

def bad_two_sum?(arr, target)
    arr.each_index do |idx1|
        arr.each_index do |idx2|
            return true if arr[idx1] + arr[idx2] == target && idx1 != idx2
        end
    end

    return false
end

def okay_two_sum?(arr, target)
    return false if arr.length <= 1
    
    mid = arr.length / 2
    arr.each_with_index do |el, idx|
        case el + arr[mid] <=> target
        when 0
            return true
        when 1
            result = okay_two_sum?(arr[idx...mid], target)
            return result if result
            next
        when -1
            new_arr = [el] + arr[mid + 1..-1]
            result = okay_two_sum?(new_arr, target)
            return result if result
            next
        end
    end

    return false

end

if __FILE__ == $PROGRAM_NAME

    arr = [0, 1, 5, 7]
    okay_two_sum?(arr, 6)

end


