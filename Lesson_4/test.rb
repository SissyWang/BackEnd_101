INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=>#{msg}"
end 

def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts " "
  puts "     |     |     "
  puts "  #{brd[1]}   |  #{brd[2]}   |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}   |  #{brd[5]}   |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}   |  #{brd[8]}   |  #{brd[9]}  "
  puts "     |     |     "
  puts " "
end 

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_square(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end 

def player_places_piece!(brd)
  square = ''
  loop do 
    prompt "choose a square ( #{empty_square(brd).join(',')}):"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Sorry, that's not a valid answer"
  end 
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_square(brd).sample
  brd[square] = COMPUTER_MARKER
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end 

  display_board(board)

  if someone_won?(board)
    prompt"#{detect_winner(board)} won!"
  else 
    prompt"It's a tie"
  end 

end 

board = initialize_board
display_board(board)