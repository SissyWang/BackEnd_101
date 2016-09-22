#1
greeting is nil, and "undefined local variable" will not show up. 
Normally when you reference an uninitialized variable, ruby will say it is undefined
however within an if block, even this if block does not get excuted, the local variable is initialized with nil

#2
informal_greeting is pointing to the greetings memory object, and it is a reference to the original object
<< can mutate the original object
so greetings got mutated

#3
a) 
"one is: one"
"two is: two"
"three is: three"

b)
"one is: one"
"two is: two"
"three is: three"

c)
"one is: two"
"two is: three"
"three is: one"

#4
method 1: 
require 'securerandom'

p SecureRandom.uuid 

method 2:
char_array = [('a'..'f'), (0..9)].map { |i| i.to_a }.flatten 

puts new_arr = char_array.sample(8).join + "-" + char_array.sample(4).join + "-" + char_array.sample(4).join + "-" + char_array.sample(4).join + "-" + char_array.sample(12).join



#5

 def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless input_string.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end