# Module to house all display functions
module Display
  def display_intro
  	3.times do 
  	  print '.'
  	  sleep(0.5)
  	end
  	puts "
     __  __           _                      _           _
    |  \\/  |         | |                    (_)         | |
    | \\  / | __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |
    | |\\/| |/ _` / __| __/ _ \\ '__| '_ ` _ \\| | '_ \\ / _` |
    | |  | | (_| \\__ \\ ||  __/ |  | | | | | | | | | | (_| |
    |_|  |_|\\__,_|___/\\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|"
    puts 'The DEATH NOTE edition'
  end

  def display_instructions
  	puts ''
  	puts 'Welcome back L'
  	puts 'Your expertise is required once again to do save the world. We recently acquired a public computer known to be used by Kira. You\'ll need to hack the security password to access the laptop.'
  	puts 'From our research we know the security password is composed of four of the following colors:'
  	puts ''
  	puts '(R)ed, (G)reen, (Y)ellow, (B)lue, (P)urple, (W)hite'
  	puts "eg: 'RRYB'"
  	puts ''
  	puts 'You have 12 attempts to hack the password.'
  	puts ''
  	puts 'After each attempt, our computers will analyze your color code and provide feedback to you like so:'
  	puts '[+][+][~]'
  	puts '[+] | Indicates one of your colors is present and is in the correct position'
  	puts '[~] | Indicates one of your colors is present but is in the incorrect position'
  	puts '    | The absence of any feedback indicates one of your colors is not present in the password'
    puts ''
    puts 'Note: the feedback is not displayed in any specific order. For example:'
    puts ''
    puts "Your code: 'RRGG'"
    puts "Feedback:  [+][+][~]"
    puts ''
    puts 'The first two [+][+] does not verify that the RR in your code is correct. It simply verifies that two of your colors are in the correct positons.'
    puts 'Hit ENTER to proceed'
    gets
  end
end