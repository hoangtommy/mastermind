# Creates the game, Mastermind and its display
class Game
  require './players.rb'
  require './game_pieces.rb'
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

    #setup_board # messages game_pieces to prep board
    #play_game # begins grabbing responses from human player
  end


  private
  
  # 
  def setup_board
    GamePieces.new
  end

  # Initiates the guesses from player
  def play_game
    until @guesses_left == 0 || code_broken
      # get guess from user
      # deliver & display feedback to user
      # display remaining guesses to user
      # repeat
      guess_sequence = @code_breaker.get_guess
      
      give_feedback(guess_sequence)

      @guesses_left -= 1
    end
    end_game
  end

  # checks player's guess against code and displays feedback
  def give_feedback(guess_sequence)
    # guess_sequence = ['P', 'P', 'G', 'R'] 
    @code_sequence = ['P', 'R', 'G', 'B']
    feedback = [] 
    sub_guess_seq = []
    sub_code_seq = []

    # First, check for matches in position and color
    guess_sequence.each_with_index do |color, idx|
      if color == @code_sequence[idx]
        feedback << '+'
      else
        sub_guess_seq << color
        sub_code_seq << @code_sequence[idx]
      end
    end

    # Second, check for matches in color but not in right position
    sub_guess_seq.each do |color|
      idx = 0
      while idx < sub_code_seq.length
        if color == sub_code_seq[idx]
          feedback << 'o'
          sub_code_seq.delete_at(idx) # remove element to prevent duplicate feedback
        end
        idx += 1
      end
    end

    feedback
  end

  # Prompts a replay to player, resets game
  def end_game
    if @guesses_left > 0
      puts 'You broke the code!'
      puts ''
      puts 'Do you want to play again? Yes/No'
      response = gets.chomp
      Game.new if response.downcase == "yes"
    else
      puts 'The game is over'
      exit
    end
  end
end

Game.new
