# Creates the game, Mastermind and its display
class Game
  require './players.rb'
  require './display.rb'

  include Display

  def initialize
    @code_breaker = Player.new('code_breaker')
    @code_maker = Player.new('code_maker')
    @code_sequence = @code_maker.code
    @guesses_left = 12
    @code_broken = false

    display_intro
    display_instructions

    play_game # begins grabbing responses from human player
  end


  private

  # Initiates the guesses from player
  def play_game
    until @guesses_left == 0
      guess_sequence = @code_breaker.get_guess
      end_game if guess_sequence == @code_sequence
      
      analysis = give_feedback(guess_sequence)
      display_feedback(analysis)
      @guesses_left -= 1
      display_remaining_guesses(@guesses_left)
    end
    end_game
  end

  # checks player's guess against code and displays feedback
  def give_feedback(guess_sequence)
    feedback = [] 
    temp_guess_seq = []
    temp_code_seq = []

    # First, check for matches in position and color
    guess_sequence.each_with_index do |color, idx|
      if color == @code_sequence[idx]
        feedback << '+'
      else
        temp_guess_seq << color
        temp_code_seq << @code_sequence[idx]
      end
    end

    # Second, check for matches in color but not in right position
    temp_guess_seq.each do |color|
      idx = 0
      while idx < temp_code_seq.length
        if color == temp_code_seq[idx]
          feedback << '~'
          temp_code_seq.delete_at(idx) # remove element to prevent duplicate feedback
        end
        idx += 1
      end
    end

    feedback
  end
  
  # Displays end game message, exits application
  def end_game
    if @guesses_left > 0
      puts "You hacked the password L! The code is: #{@code_sequence}."
      puts ''
    else
      puts 'The game is over and you\'re a loser'
    end
    exit
  end

end

Game.new
