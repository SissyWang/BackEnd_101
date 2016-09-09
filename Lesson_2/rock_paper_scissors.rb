VALID_CHOICES = ['rock','paper','scissors']

def prompt(message)
  Kernel.puts("=>#{message}")
end 

def display_result(players,computer)
  if (players == 'rock' && computer =='scissors') ||
     (players == 'paper' && computer == 'rock') ||
     (players == 'scissors' && computer == 'paper')
    prompt('You won')
  elsif (players == 'rock' && computer == 'paper') ||
        (players == 'paper' && computer == 'scissors') ||
        (players == 'scissors' && computer == 'rock')
    prompt("Computer won")
  else
    prompt("It's a tie")
  end 
end 

loop do
  choice = ''
  loop do 
    prompt("Choose one:#{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp

    if VALID_CHOICES.include?(choice)
      break
    else 
      prompt("That's not a valid choice.")
    end 
  end 

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; computer chose #{computer_choice}")

  display_result(choice,computer_choice)

  prompt("do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt("Thank you for playing")

#1. Yes it still works 
#2. When call test_method after prompt method, it works, but when call it before prompt method, it didn't worrk. 
#   Since computer reads code from the top to the bottom, so if we called test_method before prompt even being defined, the computer won't understand. 

    

