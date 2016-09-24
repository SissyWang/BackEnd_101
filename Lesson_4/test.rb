# 1. display board : draw a board use lines, and thendisplay it
# 2. find a way to define each empty square in the board 
#   1). define initial marker, player marker and computer marker 
# 3. pass the initial marker into the black spaces 
# 4. ask the user to choose a square 
#    1). define a ask for input method
#    2). make sure the input is valid, if not, loop back
#    3). valid means: 1-9, and everytime you choose a number(stand for a spacein the board), this number become invalid
#          1. define a new method : empty_square
#             select all the keys from board key-value pair, and set them all = initial_marker
#           2. if the number inserted is included in the array selected, then mark this number as X
#              if not, break loop
# 5.  display the updated board 
# 6. computer choose a square: choose a random square from all squares availiable (the elements left in empty_square array)
#     and then mark it as computer marker
# 7. display the updated board
# 8. decide if the board is full: board full = empty_square is empty 
# 9. decided who won
#     1) figure out the winning condition 
#     2) iterate through and figure out the winner 
#     3) won only when the board not full
#     4) is player win and board not full? is computer win and board not full? if tie?
#     5) prompt the winner 
# 10. play again? 

# * 3 loops in total 
#  1) easist loop : play again loop 
#  2) main game loop : if there is still element left in empty_square, go back to empty_square until nothing left
#  3) display loop : if noone wins, keep looping and refresh the board 
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=>#{msg}"
end 

def display_board(brd)
  system 'clear'
  puts " "
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
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

def play_places_piece!(brd)
square = ''
  loop do
    prompt "Choose your square(#{empty_square(brd).join(',')}):"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Not a valid answer"
  end 
  brd[square] = PLAYER_MARKER
end 

def computer_places_piece!(brd)
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
  winning_lines = [[1,2,3],[4,5,6],[7,8,9]] + 
                  [[1,4,7],[2,5,8],[3,6,9]] +
                  [[1,5,9],[3,5,7]]
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

loop do
board = initialize_board

  loop do
    display_board(board)

    play_places_piece!(board)
    binding.pry
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    binding.pry
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt"#{detect_winner(board)} won"
  else 
    prompt"It's a tie"
  end 

    prompt"Play again?"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
end 

prompt "Thank you"




