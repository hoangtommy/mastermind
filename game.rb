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
      if guess_sequence == @code_sequence
        end_game('You')
      end
      
      analysis = @ai.ai_feedback(guess_sequence, @code_sequence)
      display_feedback(analysis)
      @guesses_left -= 1
      display_remaining_guesses(@guesses_left)
    end
    end_game('You')
  end

  # Plays game where human is code maker
  def code_maker_game
    until @guesses_left == 0
      guess_sequence = @ai.ai_guess
      if guess_sequence == @code_sequence 
        end_game('AI')
      end

      analysis = @player.player_feedback(guess_sequence, @code_sequence)
      display_feedback(analysis)
      @guesses_left -= 1
      display_remaining_guesses(@guesses_left)
    end
    end_game('AI')
  end

  # Initiates one of two appropriate games
  def play_game(player_role)
    player_role == 'code breaker' ? code_breaker_game : code_maker_game
  end
  
  # Displays end game message, exits application
  def end_game(player)
    if @guesses_left > 0
      # to-do: move this display message to display.rb
      puts "#{player} hacked the password in #{12-@guesses_left} tries! The code was: #{@code_sequence}."
      display_space
    else
      puts "The game is over and #{player} loss."
    end
    exit
  end

end

Game.new
