first = ''
puts "Enter the first number:"
first = gets.chomp.to_i

second = ''
puts "Enter the second number:"
second = gets.chomp.to_i

sum = first + second
subs = first - second
times = first * second
divid = first / second
modul = first % second
power = first ** second

puts "#{first} + #{second} = #{sum}"
puts "#{first} - #{second} = #{subs}"
puts "#{first} * #{second} = #{times}"
puts "#{first} / #{second} = #{divid}"
puts "#{first} % #{second} = #{modul}"
puts "#{first} ** #{second} = #{power}"
