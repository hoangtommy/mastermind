# Creates a human player
class Player
  require './display.rb'

  include Display

  attr_reader :code

  def initialize(role)
    if role == 'code maker'
      @code = makes_code
    end
  end
  
  # Grabs user response
  # Tom: should small displays like this to the screen also be moved into display module to abstract away things?
  def get_guess
  	puts "Type in your 4 character guess. Options: R, B, P, Y, G, W"
  	guess = gets.chomp
  	guess = validate_code(guess)

  	puts "Your code: #{guess.upcase}"
  	guess_sequence = guess.upcase.split("")
  end

  # Human player gives feedback
  def player_feedback(guess_sequence, code_sequence)
  	display_space
  	puts "Your code: #{code_sequence}"
  	puts "AI Guess: #{guess_sequence}"
  	display_space
  	puts 'Type in feedback to the AI.'

  	feedback = gets.chomp
  	feedback = validate_feedback(feedback)
  end

  private
  
  # Checks inputs for alignment to possible code variations
  def validate_code(sequence)
  	until sequence.upcase =~ /^[RBPYGW]{4}$/
  	  display_error('code sequence') # Tom: is it good practice to abstract away something as small as an error message?
  	  sequence = gets.chomp
  	end
  	sequence
  end

  # Checks input for correct use of feedback
  def validate_feedback(feedback)
  	until feedback =~ /^[\s+~]{0,4}$/
  	  display_error('feedback')
  	  feedback = gets.chomp
  	end
  	feedback.split('')
  end

  # Human player creates a code sequence
  def makes_code
  	puts 'Make a 4 character secret sequence. Options: R, B, P, Y, G, W'
  	code_sequence = gets.chomp
  	code_sequence = validate_code(code_sequence)
  	code_sequence.upcase
  end


end

