# add Spock and Lizard in, there gonna be more conditions for win and lose
# shortern the user input
# build a score system

require 'pry'

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_CONDITION = {
  'r' => ['sc','l'],
  'p' => ['r', 'sp'],
  'sc' => ['p', 'l'],
  'sp' => ['sc', 'r'],
  'l' => ['sp', 'p']
}

def clear_screen
  system 'clear'
end

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  WINNING_CONDITION[first].include?(second)
end

def display_result(players, computer)
  if win?(players, computer)
    'You won'
  elsif win?(computer, players)
    "Computer won"
  else
    "It's a tie"
  end
end

loop do
  player_score = 0
  computer_score = 0
  prompt("Get 5 to win the game")
  loop do
    choice = ''
    loop do
      VALID_CHOICES.each do |k, v|
        prompt("#{k} for #{v}")
      end

      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
    #binding.pry
    computer_choice = VALID_CHOICES.keys.sample

    prompt("You chose: #{choice}; computer chose #{computer_choice}")

    if display_result(choice, computer_choice) == "You won"
      player_score += 1
      prompt"You win!"
    elsif display_result(choice, computer_choice) == "Computer won"
      computer_score += 1
      prompt"Computer win!"
    else
      prompt("0 for both side")
    end

    prompt("player's score: #{player_score}")
    prompt("computer's score: #{computer_score}")

    if player_score == 5
      prompt"Player win"
      break
    elsif computer_score == 5
      prompt("computer win")
      break
    else
      prompt("game not end yet")
      #clear_screen
    end
  end

  end_game = false

  loop do
    prompt("do you want to play again?('y'for yes 'n' for no)")
    answer = gets.chomp
      if answer.downcase.start_with?('y')
        puts "OK let's do it again then"
        break
      elsif answer.downcase.start_with?('n')
        prompt("Thank you for playing")
        end_game = true
        break
      else 
        puts "it's not a valid answer"
      end 
  end 
break if end_game
end

