# Creates one object to represent the human user, the codebreaker
class Player
  attr_reader :code

  def initialize(type)
    if type == 'code_maker'
      @code = create_code
    else

    end
  end
  
  # Grabs user response
  def get_guess
  	puts "Type in your code"
  	guess = gets.chomp
  	guess.upcase!
  	until guess =~ /^[RBPYGO]{4}$/
  	  puts "please type in a valid code sequence. eg: RRYG"
  	  puts "your options are..." # to-do: display options for user
  	  guess = gets.chomp
  	  guess.upcase!
  	end
  	guess_sequence = guess.split("")
  end

  private

  # Creates a code sequence
  def create_code
    possible_colors = ["red", "blue", "purple", "yellow", "green", "orange"]
    code_sequence = []
    until code_sequence.size == 4
      code_sequence << possible_colors[rand(6)]
    end
    code_sequence
  end

end

p n = Player.new('code_maker')
p n.code