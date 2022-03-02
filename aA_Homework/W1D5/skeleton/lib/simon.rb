class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
    @sequence_length = 1

  end

  def play
    while self.game_over == false
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if self.game_over == false
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts `clear`
    seq.each do |color|
      puts color
      puts ". . ."
      sleep 1
      puts `clear`
      puts color
      puts ". ."
      sleep 1
      puts `clear`
      puts color
      puts "."
      sleep 1
      puts `clear`
    end

  end

  def require_sequence
    puts "What is the sequence?"
    response = gets.chomp.split(' ')
    if response == self.seq
      round_success_message
    else
      self.game_over = true
    end
  end

  def add_random_color
    seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "You got it correct!"
    sleep 1

  end

  def game_over_message
    puts "You lose"

  end

  def reset_game
    self.sequence_length = 1
    self.seq = []
    self.game_over = false
  end
end
