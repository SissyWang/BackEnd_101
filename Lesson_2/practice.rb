def integer?(input)
  input.to_i.to_s == input
end 

def float?(input)
  Float(input) rescue false
end

def number?(input)
  integer?(input) || float?(input)
end

puts "inset a number"
number = gets.chomp

if integer?(number)
  puts "you inserted an integer: #{number}"
elsif float?(number)
  puts "you inserted a float number: #{number}"
else 
  puts "invalid"
end 

    





