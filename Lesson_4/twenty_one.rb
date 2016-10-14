require 'pry'
def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def initialize_deck(deck)
	deck.shuffle!
end

def display_cards(cards)
	dealer = deck.sample(2)
    you = deck.sample(2)
    puts "Dealer has: #{dealer[0][1]} and an unknow card"
    puts "You have: #{you[0][1]} and #{you[1][1]} "
end

def deal_card
	card_for_dealer = deck.sample(2)
	card_for_player = deck.sample(2)
end

def bust?(cards)
total(cards).to_i > 21
end

# calculate the total cards number in hand
def calculat_sum


end


deck = [ ['heart', 'Ace'], ["heart", "2"], ["heart", "3"], ["heart", '4'], ["heart", '5'], ["heart", '6'], ["heart", '7'], ["heart", '8'], ["heart", '9'], ["heart", '10'], ["heart", 'JACK'], ["heart", 'QUEEN'], ["heart", 'KING'] + 
         ['diamond', 'Ace'], ['diamond', '2'], ['diamond', "3"], ['diamond', '4'], ['diamond', '5'], ['diamond', '6'], ['diamond', '7'], ['diamond', '8'], ['diamond', '9'], ['diamond', '10'], ['diamond', 'JACK'], ['diamond', 'QUEEN'], ['diamond', 'KING'] + 
         ['club', 'Ace'], ['club', '2'], ['club', "3"], ['club', '4'], ['club', '5'], ['club', '6'], ['club', '7'], ['club', '8'], ['club', '9'], ['club', '10'], ['club', 'JACK'], ['club', 'QUEEN'], ['club', 'KING'] + 
         ['spade', 'Ace'], ['spade', '2'], ['spade', "3"], ['spade', '4'], ['spade', '5'], ['spade', '6'], ['spade', '7'], ['spade', '8'], ['spade', '9'], ['spade', '10'], ['spade', 'JACK'], ['spade', 'QUEEN'], ['spade', 'KING']]
    


answer = ''
player_score = 0
dealer_score = 0

loop do
    dealer = deck.sample(2)
    you = deck.sample(2)
    dealer_sum = dealer[0][1] + dealer[1][1]
    you_sum = you[0][1].to_i + you[1][1].to_i
    puts "Dealer has: #{dealer[0][1]} and an unknow card"
    puts "You have: #{you[0][1]} and #{you[1][1]} "
    puts "now your total is #{you_sum}"
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || bust?(you)
end


if bust?(cards)
    puts "game over"
else
    puts "You choose to stay"
end
