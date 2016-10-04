def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num = ''
loop do 
puts ">> Please enter the numerator:"
num = gets.chomp
if valid_number?(num) == true
    break
else 
    puts "Invalid input. Only integers are allowed."
end 
end 

den= ''
loop do 
puts ">> Please enter the denominator:"
den = gets.chomp
if den.to_i == 0 
    puts "Invalid input. A denominator of 0 is not allowed."
elsif valid_number?(den) == true
    break
else 
    puts "Invalid input. Only integers are allowed."
end
end

result = num.to_f / den.to_f

puts "#{num} / #{den} is #{result}"