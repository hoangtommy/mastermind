# Creates a human player
class Player
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

  private
  
  # Checks inputs for alignment to possible code variations
  def validate_code(sequence)
  	until sequence.upcase =~ /^[RBPYGW]{4}$/
  	  puts "Please type in a valid sequence. eg: RRYG"
  	  puts "Your options are: R, B, P, Y, G, W"
  	  sequence = gets.chomp
  	end
  	sequence
  end

  # Human player creates a code sequence
  def makes_code
  	puts 'Make a 4 character secret sequence. Options: R, B, P, Y, G, W'
  	code_sequence = gets.chomp
  	code_sequence = validate_code(code_sequence)
  	code_sequence.upcase
  end

  # Human player gives feedback
  def player_feedback(guess_sequence)

  end

end
