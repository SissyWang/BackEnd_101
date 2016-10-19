numbers = []

first = ''
puts  '==> Enter the 1st number:'
first = gets.chomp
numbers << first

second = ''
puts '==> Enter the 2nd number:'
second = gets.chomp
numbers << second

third = ''
puts '==> Enter the 3rd number:'
third = gets.chomp
numbers << third

fourth = ''
puts '==> Enter the 4th number:'
fourth = gets.chomp
numbers << fourth

five = ''
puts '==> Enter the 5th number:'
five = gets.chomp
numbers << five

last = ''
puts '==> Enter the last number:'
last = gets.chomp


if numbers.include?(last)
puts "The number #{last} appears in #{numbers.map(&:to_i)}"
else
puts "The number #{last} does not appear in #{numbers.map(&:to_i)}"
end