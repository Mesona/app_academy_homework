require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    self.cups.each_index do |cup|
      if cup == 6 || cup == 13
        self.cups[cup] = []
      else
        self.cups[cup] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    elsif self.cups[start_pos] == []
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    # debugger
    stones = cups[start_pos]
    self.cups[start_pos] = []
    next_cup = start_pos + 1
    while ! stones.empty?
      if next_cup > 13
        next_cup = next_cup - 14
      end
      if current_player_name == @player1 && next_cup == 13
      elsif current_player_name == @player2 && next_cup == 6
      else
        self.cups[next_cup] << stones.shift
      end
      next_cup += 1
    end

    render
    next_turn(next_cup - 1)
  end

  def next_turn(ending_cup_idx)
    # debugger
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx] == [:stone]
      return :switch
    else
      return ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    # debugger
    if @cups[0..5] == [[],[],[],[],[],[]] || @cups[7..12] == [[],[],[],[],[],[]] 
      return true
    else
      return false
    end
  end

  def winner
    if @cups[6].count == @cups[13].count
      return :draw
    elsif @cups[6].count > @cups[13].count
      return @player1
    else
      return @player2
    end
  end
end
