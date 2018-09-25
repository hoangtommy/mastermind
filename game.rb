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

  def play_game
    until @guesses_left == 0 || code_broken
      # get guess from user
      # deliver & display feedback to user
      # display remaining guesses to user
      # repeat
      guess = @code_breaker.get_guess # to-do: make get_guess method
      if guess 

      @guesses_left -= 1
    end
  end

  def give_feedback(guess)
    
  end

end