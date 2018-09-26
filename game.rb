# Creates the game, Mastermind and its display
class Game
  require './players.rb'
  require './game_pieces.rb'

  def initialize
    @code_breaker = Player.new('code_breaker')
    @code_maker = Player.new('code_maker')
    @code_sequence = @code_maker.code
    @guesses_left = 12
    @code_broken = false

    setup_board # messages game_pieces to prep board
    play_game # begins grabbing responses from human player
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
      guess = @code_breaker.get_guess
      
      give_feedback(guess)

      @guesses_left -= 1
    end
    end_game
  end

  # checks player's guess against code and displays feedback
  def give_feedback(guess)
    @code_sequence = ['P', 'R', 'G', 'B']
    guess # eg.          [R, P, Y, R] 
    feedback = [] # [Green, Red, Red, Yello] 
                  # Green is correct position & color
                  # Yellow is correct in color
                  # Red is incorrect altogether
    @code_sequence.each do |color| # 'R', 0
      idx = 0
      while idx < @code_sequence.size


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
