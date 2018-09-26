# Creates one object to represent the human user, the codebreaker
class Player
  attr_reader :code

  def initialize(type)
    if type == 'code_maker'
      @code = create_code
    else
      # Enhancement: add instance for 2nd human player
    end
  end
  
  # Grabs user response
  def get_guess
  	puts "Type in your code"
  	guess = gets.chomp
  	until guess.upcase! =~ /^[RBPYGO]{4}$/
  	  puts "please type in a valid code sequence. eg: RRYG"
  	  puts "your options are: R, B, P, Y, G, O" # to-do: display options for user
  	  guess = gets.chomp
  	end
  	guess_sequence = guess.split("")
  end

  private

  # Computer player creates a code sequence
  def create_code
    possible_colors = ["red", "blue", "purple", "yellow", "green", "orange"]
    code_sequence = []
    until code_sequence.size == 4
      code_sequence << possible_colors[rand(6)]
    end
    code_sequence
  end

end
