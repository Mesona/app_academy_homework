def anagrams_phase_one?(word, target)
    anagrams = word.chars.permutation.to_a
    anagrams.map! do |string|
        string.join("")
    end
    anagrams.include?(target)
end

def anagrams_phase_two?(word, target)
    word_array = word.split('')
    target_array = target.split('')

    word_array.each do |letter|
        index = target_array.find_index(letter)
        return false if index == nil
        target_array.delete_at(index)
    end

    return false if target_array.length > 0
    return true
end

def anagrams_phase_three?(word, target)
    word.chars.sort == target.chars.sort
end

def anagrams_phase_four?(word, target)
    word_hash = Hash.new(0)
    target_hash = Hash.new(0)
    word.chars.each do |letter|
        word_hash[letter] += 1
    end

    target.chars.each do |letter|
        target_hash[letter] += 1
    end

    word_hash == target_hash
end


