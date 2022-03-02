require_relative "card"

class Deck
    attr_reader :cards
    def initialize
        @cards = []
    end

    def generate
        nums = *(1..13)
        suits = %w(Diamonds Spades Hearts Clubs)
        nums.each do |num|
            suits.each do |suit|
                cards << Card.new(num, suit)
            end
        end

        return ''
    end

    def shuffle 
        cards.shuffle!
    end
end