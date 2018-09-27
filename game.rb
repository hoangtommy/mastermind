# Creates the game, Mastermind and its display
class Game
  require './players.rb'
  require './ai.rb'
  require './display.rb'

  include Display

  def initialize
    display_intro
    display_instructions

    @player_role = display_get_player_role
    @player = Player.new(@player_role)
    if @player_role == 'code maker'
      @code_sequence = @player.code
      @ai = Ai.new('code breaker')
    else
      @ai = Ai.new('code maker')
      @code_sequence = @ai.code
    end

    @guesses_left = 12
    play_game(@player_role)
  end


  private

  # Plays game where human is guesser
  def code_breaker_game
    until @guesses_left == 0
      guess_sequence = @player.get_guess
      end_game if guess_sequence == @code_sequence
      
      analysis = @ai.ai_feedback(guess_sequence, @code_sequence)
      display_feedback(analysis)
      @guesses_left -= 1
      display_remaining_guesses(@guesses_left)
    end
    end_game
  end

  # Plays game where human is code maker
  def code_maker_game
    until @guesses_left == 0
      guess_sequence = @ai.ai_guess
      end_game if guess_sequence = @code_sequence

      analysis = @player.player_feedback(guess_sequence, @code_sequence)
      display_feedback(analysis)
      @guesses_left -= 1
      display_remaining_guesses
    end
    end_game
  end

  # Initiates one of two appropriate games
  def play_game(player_role)
    player_role == 'code breaker' ? code_breaker_game : code_maker_game
  end
  
  # Displays end game message, exits application
  def end_game
    if @guesses_left > 0
      # to-do: move this display message to display.rb
      puts "You hacked the password L! The code is: #{@code_sequence}."
      puts ''
    else
      puts 'The game is over and you\'re a loser'
    end
    exit
  end

end

Game.new
