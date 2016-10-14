

def initialized_deck 
	initialized_deck = [ ['heart', 'Ace'], ["heart", "2"], ["heart", "3"], ["heart", '4'], ["heart", '5'], ["heart", '6'], ["heart", '7'], ["heart", '8'], ["heart", '9'], ["heart", '10'], ["heart", 'JACK'], ["heart", 'QUEEN'], ["heart", 'KING'] + 
         ['diamond', 'Ace'], ['diamond', '2'], ['diamond', "3"], ['diamond', '4'], ['diamond', '5'], ['diamond', '6'], ['diamond', '7'], ['diamond', '8'], ['diamond', '9'], ['diamond', '10'], ['diamond', 'JACK'], ['diamond', 'QUEEN'], ['diamond', 'KING'] + 
         ['club', 'Ace'], ['club', '2'], ['club', "3"], ['club', '4'], ['club', '5'], ['club', '6'], ['club', '7'], ['club', '8'], ['club', '9'], ['club', '10'], ['club', 'JACK'], ['club', 'QUEEN'], ['club', 'KING'] + 
         ['spade', 'Ace'], ['spade', '2'], ['spade', "3"], ['spade', '4'], ['spade', '5'], ['spade', '6'], ['spade', '7'], ['spade', '8'], ['spade', '9'], ['spade', '10'], ['spade', 'JACK'], ['spade', 'QUEEN'], ['spade', 'KING']]

end

def welcome
puts "Welcome"
end

def allocate_card_to_player(hold1, hold2)
#1. get the value of the last card after shuffle
#2. turn the value into a integer and then add it to the player_score
#3. delete the value from the deck 

	var = hold1.pop
	if var[1].to_i == 0 && var[1]!= 'Ace'
		hold2 += 10
	elsif var[1] == 'Ace'
		if hold2 > 10
			hold2 += 1
		else
			hold2 += 11
		end
	else 
	  hold2 += var[1].to_i
	end

	var2 = hold1.pop
	if var2[1].to_i == 0 && var2[1] != 'Ace'
		hold2 += 10
	elsif var2[1] == 'Ace'
		if hold2 > 10
			hold2 += 1
		else
			hold2 += 11
		end
	else 
	  hold2 += var2[1].to_i
	end

	puts "Your got 2 cards: #{var[1]} of #{var[0]} and #{var2[1]} of #{var2[0]}"
	puts "Your score is #{hold2}"
	hold2
end

def allocate_card_to_dealer(hold1, hold2)
	var = hold1.pop
		if var[1].to_i == 0 && var[1]!= 'Ace'
		hold2 += 10
	elsif var[1] == 'Ace'
		if hold2 > 10
			hold2 += 1
		else
			hold2 += 11
		end
	else 
	  hold2 += var[1].to_i
	end

	var2 = hold1.pop
	if var2[1].to_i == 0 && var2[1] != 'Ace'
		hold2 += 10
	elsif var2[1] == 'Ace'
		if hold2 > 10
			hold2 += 1
		else
			hold2 += 11
		end
	else 
	  hold2 += var2[1].to_i
	end

	puts "Dealer got 2 cards: #{var[1]} of #{var[0]} and another card"
	hold2
end

answer = ''
def hit_play_player(hold1, hold2)
# argument: player_score
# general purpose : to increase the player score 
# return: the value of the addtional points that will be added to player score
# check if player busted? 
loop do
puts "Do you want to hit or stay?"
answer = gets.chomp.downcase
if answer == 'hit'
	score = hold2.pop
	puts "you got #{score[0]} of #{score[1]}"
	if score[1].to_i == 0 && score[1] != 'Ace'
		hold1 += 10
	elsif score[1] == 'Ace'
		if hold1 > 10
			hold1 += 1
		else
			hold1 += 11
		end
	else 
	  hold1 += score[1].to_i
	end
	puts "now your score is #{hold1}"
	if hold1.to_i > 21
		puts "player busted"
		return 'bust'
	end 
else
	 answer == 'stay'
	 puts 'You choose to stay'
	 hold1 += 0
	 break
end
end
	puts "now your score is #{hold1}"
	hold1
end

def hit_play_dealer(hold1,hold2)
loop do
if  hold1.to_i <= 17
	score = hold2.pop
	puts "dealer got #{score[0]} of #{score[1]}"
	if score[1].to_i == 0 && score[1] != 'Ace'
		hold1 += 10
	elsif score[1] == 'Ace'
		if hold1 > 10
			hold1 += 1
		else
			hold1 += 11
		end
	else 
	  hold1 += score[1].to_i
	end
	puts "now dealer score is #{hold1}"
	if hold1.to_i > 21
		puts "dealer busted"
		return 'bust'
	end 
else
	 hold1.to_i > 17
	 puts 'dealer choose to stay'
	 hold1 += 0
	 break
end
end
	puts "now dealer score is #{hold1}"
	hold1
end	

def compare_score(hold1, hold2)
	if hold1 > hold2
		puts 'player win'
	else
		puts 'dealer win'
	end
end

answer = nil

loop do
player_score = 0
dealer_score = 0
loop do
	new_deck = initialized_deck 
	shuffled_deck = new_deck.shuffle!
	welcome
	player_score += allocate_card_to_player(shuffled_deck, player_score)
	dealer_score += allocate_card_to_dealer(shuffled_deck, dealer_score)
	player_score = hit_play_player(player_score, shuffled_deck)
	if player_score == 'bust'
		puts 'dealer win'
		break
	end
	dealer_score = hit_play_dealer(dealer_score, shuffled_deck)
	if dealer_score == 'bust'
	   puts 'player win'
	   break
	end
	compare_score(player_score, dealer_score)
	break
end

puts 'do you want to play again?(y or n)?'
answer = gets.chomp.downcase
break unless answer.start_with?('y')
end


# loop do

# 1. initialized_deck(create new deck)

# 2. shuffle

# 3. display_welcome

# 4. allocate_card_to_player

# 5. allocate_card_to_dealer

# loop do

# 	6. player_turn(loop inside)
# 	   hit or stay? 

# 	7. player_busted？(return true or false)
# 	   if yes, go to 11

# 	8. dealer_turn(loop inside)

# 	9. dealer_busted?
# 		if yes, go to 11

# 	10. compare scores
# end

# 11. decide winner

# 12. play again?(yes or no)

# 13. reset if yes, go back to 1

# end
