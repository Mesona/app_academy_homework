require 'tdd'

RSpec.describe "my_uniq" do
    it "should have only 1 of each instance" do
        array = [1, 2, 2, 3, 2, 3, 5]
        expect(array.my_uniq).to eq(array.uniq)
    end

    it "should sort output" do
        array = [5, 5, 3, 2, 3, 1] 
        expect(array.my_uniq).to eq(array.uniq.sort)
    end 
end


RSpec.describe "my_two_sums" do 
    it "should find index of pairs where value equals 0" do 
        expect([1, -1].my_two_sums).to eq([[0, 1]])
    end

    it "should sort smaller index first" do  
        expect([0, 0, 1, -1].my_two_sums).to eq([[0, 1], [2, 3]])
    end

    it "should sort smaller second index" do 
        expect([0, 0, 0].my_two_sums).to eq([[0,1], [0,2], [1,2]])
    end
end

RSpec.describe "my_transpose" do 
        array = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
    it "checks transposed row 1" do 
        expect(my_transpose(array)[0]).to eq([0, 3, 6])
    end
    it "checks transposed row 2" do 
        expect(my_transpose(array)[1]).to eq([1, 4, 7])
    end
    it "checks transposed row 3" do 
        expect(my_transpose(array)[2]).to eq([2, 5, 8])
    end
end


RSpec.describe "stock_picker" do
    it "return an output array of length 2" do
        array = [1, 2, 3, 4, 5]
        expect(stock_picker(array).length).to eq(2)
    end

    it "checks if output is most profitable" do
        array = [1, 4, 10, 15]
        expect(stock_picker(array)).to eq([0, 3])
    end


    # it "checks if stock is sold before it is bought" do
    #     # # array = [10, 3, 5, 6]
    #     # allow([1,2]).to receive(:stock_picker).and_return([1,0])
    #     # expect { stock_picker([1, 2]) }.to 
    # end
end


#Check if user is picking from an empty pile 
#Cannot move piece on to smaller piece 
#Array = [3, 2, 1] not on starting position 
# RSpec.describe "towers_of_hanoi" do
#     context "#move" do
#         it "makes sure pieces are placed properly" do

#             expect(towers_of_hanoi.move())
#         end
#     end
# end




