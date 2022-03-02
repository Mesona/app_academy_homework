require 'card'
require 'rspec'
require 'deck'

RSpec.describe "deck" do 
    let(:deck) { Deck.new } 
    before(:each) do 
        deck.generate
    end
    describe "#generate" do 
        it "builds the deck" do 
            expect(deck.cards.count).to eq(52) 
        end

        it "should not contain duplicates" do 
            expect(deck.cards).to eq(deck.cards.uniq)
        end
    end

    describe "#shuffle" do 
        it "shuffles the deck" do
            pre_shuffle = deck.cards.dup
            deck.shuffle
            expect(deck.cards).to_not eq(pre_shuffle)
        end
    end

   
end