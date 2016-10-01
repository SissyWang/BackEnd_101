require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
FIRST = 'choose'.freeze

def prompt(msg)
  puts "=> #{msg} "
end

def display_board(brd)
  system 'clear'
  puts "You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts " "
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts " "
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(arr, delimiter = ', ', word = 'or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2?  arr.join(' ') : arr.join(delimiter)
end

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_square(brd), ', ')}:"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Soorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
      # offense
      return brd[line[2]] = COMPUTER_MARKER if brd[line[0]] == COMPUTER_MARKER && brd[line[1]] == COMPUTER_MARKER && brd[line[2]] == INITIAL_MARKER
      return brd[line[1]] = COMPUTER_MARKER if brd[line[0]] == COMPUTER_MARKER && brd[line[2]] == COMPUTER_MARKER && brd[line[1]] == INITIAL_MARKER
      return brd[line[0]] = COMPUTER_MARKER if brd[line[1]] == COMPUTER_MARKER && brd[line[2]] == COMPUTER_MARKER && brd[line[0]] == INITIAL_MARKER
      # defense
      return brd[line[2]] = COMPUTER_MARKER if brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == INITIAL_MARKER
      return brd[line[1]] = COMPUTER_MARKER if brd[line[0]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER && brd[line[1]] == INITIAL_MARKER
      return brd[line[0]] = COMPUTER_MARKER if brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER && brd[line[0]] == INITIAL_MARKER
   end
      return brd[5] = COMPUTER_MARKER if brd[5] == INITIAL_MARKER
      square = empty_square(brd).sample
      brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_square(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
       brd[line[1]] == COMPUTER_MARKER &&
       brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def player_win(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    return true if brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER
  end
  false
end

def computer_win(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    return true if brd[line[0]] == COMPUTER_MARKER &&
    brd[line[1]] == COMPUTER_MARKER &&
    brd[line[2]] == COMPUTER_MARKER
  end
  false
end

player_score = 0
computer_score = 0
loop do
  prompt"Get 5 to win the game"
  sleep(2)
  if FIRST == 'choose'
    prompt"Who do you want play first? 'p' for player 'c' for computer"
    answer = gets.chomp
    loop do
      if answer.downcase.start_with?('c')
        prompt "OK, computer go first"
        break
      elsif answer.downcase.start_with?('p')
        prompt "OK, player go first"
        break
      else
        prompt "This is not a valid answer, try again"
      end
    end
  end
  sleep(3)

  board = initialize_board

  loop do
    display_board(board)

    if FIRST == "computer"
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

    elsif FIRST == "player"
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

    else
      if answer.downcase.start_with?('c')
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        display_board(board)

        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      elsif answer.downcase.start_with?('p')
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
    end
  end

  display_board(board)

  if player_win(board)
    prompt"player won!"
    player_score += 1

  elsif computer_win(board)
    prompt"Computer won"
    computer_score += 1
  else
    prompt"It's a tie!"
  end

  prompt "Computer score is #{computer_score}"
  prompt "Player score is #{player_score}"

  if player_score == 5 || computer_score == 5
    prompt"#{detect_winner(board)} win"
    prompt"Play again?(y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  else
    prompt("game not end yet")
  end
end

prompt "Thanks for playing Tic Tac Toe. Good bye!"
