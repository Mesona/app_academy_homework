
class Array
    def my_uniq
        result = []
        self.each do |el|
            if ! result.include?(el)
                result << el
            end
        end
        return result.sort
    end

    def my_two_sums
        result = []
        self.each_with_index do |num1, idx1|
            self.each_with_index do |num2, idx2|
                if num1 + num2 == 0 && idx1 < idx2
                    result << [idx1, idx2]
                end
            end
        end
        result 
    end


end


def my_transpose(array)
    result = Array.new(array.length) { Array.new } # [nil, nil, nil]
    
    array.each do |row| # [0, 1, 2] # [0, 3, 6]
                        # [3, 4, 5] # [1, 4, 7]
                        # [6, 7, 8] # [2, 5, 8]
        row.each_with_index do |col_val, idx| 
            result[idx] << col_val
        end
    end

    result
end

# [14, 3, 8, 3, 5, 10]
# [pair of days]
# [[1, 2],[3, 5]]
# [1, 5]
# [14, 3, 8, 3, 5, 10]
# diff = X
# result = [1, 2]
# arr.each_index once
# arr.each_index twice
# if arr[once] - arr[twice] > diff && twice < once
# result = [twice, once]
class StealingError < StandardError ; end

def stock_picker(array)
    diff = array[0] - array[1]
    result = [array[0], array[1]]
    array.each_with_index do |num1, idx1|
        array.each_with_index do |num2, idx2|
            if num1 - num2 > diff && idx2 < idx1 
                diff = num1 - num2
                result = [idx2, idx1]
            end
        end
    end
    if result[0] > result[1]
        raise StealingError
    end
    result 
end