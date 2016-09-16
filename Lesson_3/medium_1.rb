#1
10.times do |num|
  puts (" "* num) + "The Flintstones Rock!"
end 

#2
method 1 :

arr = statement.chars
arr.delete(' ')

hash={}
arr.each do |letter|
  if !hash.key?(letter)
    hash[letter] = 1
  elsif hash.key?(letter)
    hash[letter] += 1
  end 
end 

method 2: 
hash = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.scan(letter).count 
  hash[letter] = letter_frequency if letter_frequency > 0
end 

#3
we can only concatnate string with another string, for example "string" + "string" => "stringstring"
but we cant concatnate string with integers 
so it is an error 
if we change the integer into string : 
  puts "the value of 40 + 2 is " + (40+2).to_s
or using the string interpolation :
  puts "the value of 40 + 2 is #{40+2}" 
it will fix the problem 

#4 
1)
1
3
reason: the computer interpete code from top to bottom
first the computer iterate to 'p number', so it printed the number 1 to the screen
and then computer iterate to second order, which is to delete the first element in the array 
at that moment, the first element in the array is 2, since 1 is already printed out and it is already gone 
so the computer deleted 2 
after that it iterate back again, and iterate to 'p number' again, and the only element left is 3
so 3 got printed 

2)
1
2
reason: the computer interpete code from top to bottom
first the computer iterate to 'p number', so it printed the number 1 to the screen
and then computer iterate to second order, which is to delete the last element in the array
at that moment, the first element in the array is 4, so the computer deleted 4 
after that it iterate back again, and iterate to 'p number' again, and printed 2
and then computer iterate to second order, which is to delete the last element in the array
at that moment, the first element in the array is 3, so the computer deleted 3
so the result becomes 1 and 2

#5
method 1: 
def factors(number)
dividend = number 
divisors = []
  loop do 
    if number == 0 
      puts "0 is not a valid dividentd. Try again."
      break
    elsif number < 0
      puts "negative number will cause infinate loop.Try again"
      break
    else 
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
      break unless dividend > 0
    end 
  end 
  divisors 
end 

method 2: 
while dividend > 0 do 
  divisors << number / dividend if number % dividend == 0
  dividend -= 1
end 

bonus 1: 
To make sure dividend is a integer factor of number

bonus 2: 
To make sure the return of factors method is divisors 


#6 
Those two methods will return the same value (buffer), but there is a difference. 
For the first method, buffer is a parameter, and it can only be an array (since shift method can only be used on an array)
by doing buffer << new_element, we added a new element in to the memory object that buffer originally pointing at
for the second method, buffer is a new variable, because it was setted as a variable 
we added input_array + [new_element] to the variable buffer, but this would not change the origional memory objective, instead, it will assign a new memory objective for buffer 
now buffer is pointing at a new memory object


#7
Because we defined the variable limit outside the scope of fib method 
A method can not reach the variable out side its scope 
to fix it : 
def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

=> result is 21

#8
method 1:
arr = "this is a string"
new_arr = arr.split

array = new_arr.map do |x|
  x.capitalize
end 

puts array.join(' ')

method 2:
arr = "this is a string"
new_arr = arr.split

new_arr.each do |x|
  x.capitalize!
end 

puts new_arr.join(' ')


#9
munsters.each do |name,details|
  case details 
  when (0..17)
    details["age_group"] = "kids"
  when (18..64)
    details["age_group"] = "adults"
  else 
    details["age_group"] = "seniors"
  end 
end 






        