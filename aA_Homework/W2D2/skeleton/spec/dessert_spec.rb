require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("flan", 10, :chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type.empty?).to be false
    end

    it "sets a quantity" do
      expect(dessert.quantity).to be(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("flan", "ten", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("bread")
      expect(dessert.ingredients.count).to be(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("salt")
      dessert.add_ingredient("water")
      dessert.add_ingredient("chocolate")
      dessert.add_ingredient("pickles")
      dessert.add_ingredient("olives")
      dessert.add_ingredient("salami")
      dessert.add_ingredient("sand")
      dessert.mix!
      expect(dessert.ingredients.sort).to eq(dessert.ingredients.sort)
      expect(dessert.ingredients).to_not eq(dessert.ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to be(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(12) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # expect { dessert.serve.chars.first }.to be(dessert.serve.first.upcase)
      allow(chef).to receive(:titleize).and_return("Chef Ramsey")
      expect(dessert.serve).to eq("Chef Ramsey has made 10 flan!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
