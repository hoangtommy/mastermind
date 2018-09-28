# Module to house all display functions
module Display
  def display_space
  	puts ''
  end

  def display_intro
  	3.times do 
  	  print '.'
  	  sleep(0.5)
  	end
  	puts 'Welcome to'
  	puts "
     __  __           _                      _           _
    |  \\/  |         | |                    (_)         | |
    | \\  / | __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |
    | |\\/| |/ _` / __| __/ _ \\ '__| '_ ` _ \\| | '_ \\ / _` |
    | |  | | (_| \\__ \\ ||  __/ |  | | | | | | | | | | (_| |
    |_|  |_|\\__,_|___/\\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|"
  end


  def display_instructions
  	display_space
  	puts 'Hello Agent 47'
  	puts 'Your expertise is required once again to help the government do corrupt things, er we mean save the world. You\'ll need to hack the security password this stolen laptop to complete the mission.'
  	puts 'From our research we know the security password is composed of four of the following colors:'
  	display_space
  	puts '(R)ed, (G)reen, (Y)ellow, (B)lue, (P)urple, (W)hite'
  	puts "eg: 'RRYB'"
  	display_space
  	puts 'You have 12 attempts to hack the password.'
  	display_space
  	puts 'After each attempt, our computers will analyze your code sequence and provide feedback to you like so:'
  	puts '[+][+][~]'
  	puts '[+] | Indicates one of your colors is present and is in the correct position'
  	puts '[~] | Indicates one of your colors is present but is in the incorrect position'
  	puts '    | The absence of any feedback indicates one of your colors is not present in the password'
    display_space
    puts 'Note: the feedback is not displayed in any specific order. For example:'
    display_space
    puts "Your code: 'RRGG'"
    puts "Feedback:  [+][+][~]"
    display_space
    puts 'The first two [+][+] do not verify that the RR in your code is correct. It simply verifies that two of your colors are in the correct positons.'
    display_space
    puts 'Hit ENTER to proceed'
    gets
  end

  def display_get_player_role
  	puts 'Would you like the play the role of the code breaker or the code maker?'
  	role = gets.chomp
  	until role.downcase == 'code breaker' || role.downcase == 'code maker'
  		puts "Please type in 'code breaker' or 'code maker'."
  		role = gets.chomp
  	end
  	role.downcase
  end

  def display_feedback(analysis)
    print "Feedback: #{analysis}"
    display_space
  end

  def display_remaining_guesses(guesses_left)
  	puts "Attempts remaining: #{guesses_left}"
  	display_space
  end

  def display_error(type)
  	display_space
  	if type == 'code sequence'
  	  puts "Please type in a valid sequence. eg: RRYG"
  	  puts "Your options are: R, B, P, Y, G, W"
  	elsif type == 'feedback'
      puts 'Please provide valid feedback. eg: +~+'
      puts 'Your options are: (nothing), +, ~'
    end
  end

end