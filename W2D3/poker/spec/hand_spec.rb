require 'hand'
require 'rspec'

RSpec.describe "hand" do
    let(:hand) { Hand.new() }


    # Need to test current_winning_hand variable
    # need to test current_winning_hand_score variable
    
    describe "#hand_score" do
        it "Checks for high single" do
            high_single_hand = [[[1, "Spades"], [3, "Diamonds"], [6, "Hearts"], [7, "Clubs"], [12, "Spades"]]]
            expect(hand_score(hand)).to eq(12)
        end

        it "Checks for a single pair" do
            single_pair_hand = [[[1, "Spades"], [6, "Diamonds"], [6, "Hearts"], [7, "Clubs"], [12, "Spades"]]]
            expect(hand_score(hand)).to eq(14)
        end

        it "Checks for a two pair" do
            two_pair_hand = [[[7, "Spades"], [6, "Diamonds"], [6, "Hearts"], [7, "Clubs"], [12, "Spades"]]]
            expect(hand_score(hand)).to eq(15)
        end

        it "Checks for three of a kind" do
            three_of_a_kind_hand = [[[6, "Spades"], [6, "Diamonds"], [6, "Hearts"], [7, "Clubs"], [12, "Spades"]]]
            expect(hand_score(hand)).to eq(16)
        end

        it "Checks for a straight" do
            straight_hand = [[[1, "Spades"], [2, "Diamonds"], [3, "Hearts"], [4, "Clubs"], [5, "Spades"]]]
            expect(hand_score(hand)).to eq(17)
        end

        it "Checks for a flush" do
            flush_hand = [[[1, "Spades"], [6, "Spades"], [8, "Spades"], [7, "Spades"], [12, "Spades"]]]
            expect(hand_score(hand)).to eq(18)
        end

        it "Checks for a full house" do
            full_house_hand = [[[2, "Spades"], [2, "Diamonds"], [3, "Hearts"], [3, "Clubs"], [3, "Spades"]]]
            expect(hand_score(hand)).to eq(19)
        end

        it "Checks for four of a kind" do
            four_of_a_kind_hand = [[[2, "Spades"], [3, "Diamonds"], [3, "Hearts"], [3, "Clubs"], [3, "Spades"]]]
            expect(hand_score(hand)).to eq(20)
        end

        it "Checks for a straight flush" do
            straight_flush_hand = [[[2, "Spades"], [3, "Spades"], [4, "Spades"], [5, "Spades"], [6, "Spades"]]]
            expect(hand_score(hand)).to eq(21)
        end

        it "Checks for a royal flush" do
            royal_hand = [[[13, "Spades"], [12, "Spades"], [11, "Spades"], [10, "Spades"], [1, "Spades"]]]
            expect(hand_score(hand)).to eq(22)
        end
    end

    describe "#winning_hand" do
        it "Checks for the highest scoring hand" do
            low_hand = [[1, "Spades"], [3, "Diamonds"], [6, "Hearts"], [7, "Clubs"], [12, "Spades"]]
            high_hand = [[13, "Spades"], [12, "Spades"], [11, "Spades"], [10, "Spades"], [1, "Spades"]]
            hand.winning_hand(low_hand, high_hand)
            expect(hand.current_winning_hand).to eq(high_hand)
            expect(current_winning_hand_score).to eq(hand.hand_score([high_hand]))
        end

        it "Tie breaker logic -- four of a kind"

        it "Tie breaker logic -- three of a kind (And full house)"

        it "Tie breaker logic -- High single"

        it "Tie breaker logic -- two pair"

        it "Tie breaker logic -- one pair"

        it "Tie breaker logic -- striaghts"
            single_pair_hand = [[[1, "Spades"], [6, "Diamonds"], [6, "Hearts"], [7, "Clubs"], [12, "Spades"]]]
            single_pair_hand2 = [[[2, "Diamonds"], [8, "Spades"], [8, "Hearts"], [6, "Spades"], [11, "Clubs"]]]
            hand.winning_hand(single_pair_hand, single_pair_hand2)
            expect(hand.current_winning_hand).to eq()
            
    end
end


