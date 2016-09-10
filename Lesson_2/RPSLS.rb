# add Spock and Lizard in, there gonna be more conditions for win and lose
# shortern the user input
# build a score system

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'r' && second == 'l') ||
    (first == 'p' && second == 'r') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sc' && second == 'p') ||
    (first == 'sc' && second == 'l') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'sp' && second == 'r') ||
    (first == 'l' && second == 'sp') ||
    (first == 'l' && second == 'p')
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

      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.keys.sample

    prompt("You chose: #{choice}; computer chose #{computer_choice}")

    if display_result(choice, computer_choice) == "You won"
      player_score += 1
    elsif display_result(choice, computer_choice) == "Computer won"
      computer_score += 1
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
    end
  end

  prompt("do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing")
