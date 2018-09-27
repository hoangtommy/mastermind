# Creates an ai player
class Ai
  attr_reader :code

  def initialize(purpose_of_existing)
  	if purpose_of_existing == 'code maker'
  		@code = make_code
  	end
  end

  # ai guesses code
  def ai_guess
  	
  end

  # ai gives feedback
  def ai_feedback(guess_sequence, code_sequence)
    feedback = []

    # These variables are used for the 2nd check
    # to-do: rename for clarity, eg. subset_guess_seq
    temp_guess_seq = []
    temp_code_seq = []

    # First, check for matches in position and color
    guess_sequence.each_with_index do |color, idx|
      if color == code_sequence[idx]
        feedback << '+'
      else
        temp_guess_seq << color
        temp_code_seq << code_sequence[idx]
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


  private

  # ai creates a code sequence
  def make_code
    possible_colors = ["R", "B", "P", "Y", "G", "W"]
    code_sequence = []
    until code_sequence.size == 4
      code_sequence << possible_colors[rand(6)]
    end
    code_sequence
  end

end
