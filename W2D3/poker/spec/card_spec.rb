require 'card'
require 'rspec'

RSpec.describe "card" do
    let(:card) { Card.new(8, "Diamonds") }

    it "sets parameter num to an integer" do
        expect(card.num.class).to be(Integer)
    end

    it "sets parameter suit to a string" do
        suits = ["Diamonds", "Spades", "Hearts", "Clubs"]
        expect(suits.include?(card.suit)).to be(true)
    end
end
