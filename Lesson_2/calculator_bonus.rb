# Better integer validation
# option 1
def integer?(input)
  input.to_i.to_s == input
end

puts ("insert a number")
number = gets.chomp



if integer?(number)
  puts number 
else 
  puts ("invalid")
end 

# option 2
def integer?(input)
  /^\d+$/.match(input)
end

puts ("Insert a number?")
number = gets.chomp

if integer?(number)
  puts number 
else 
  puts "invalid"
end 

# option 3
def integer?(input)
  Integer(input) rescue false
end

puts 'insert a number'
number = gets.chomp

if integer?(number)
  puts number
else 
  puts 'invalid'
end 


# Number validation
# option 1
def integer?(input)
  input.to_i.to_s == input
end 

def float?(input)
  input.to_f.to_s == input
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


# option 2
def integer?(input)
  input.to_i.to_s == input
end 

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
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


# option 3
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
