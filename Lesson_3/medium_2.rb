#1 
total_male_age = 0
munsters.each do |name,details|
  total_male_age += details["age"] if details["gender"] == "male"
end 

#2
munsters.each do |name,details|
  puts "#{name} is a #{details["age"]} years old #{details["gender"]}"
end 

#3
def not_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param,an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string,my_array = not_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


#4
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/) # \W is regular expression, means A non-word character. I splited the sentence base on the space and comma, and then turned it into an array
words.reverse! #The array got revsersed 
backwards = words.join(' ') + '.' 

#5
34.
fixnum is immutable. So answer is 42, that will not change

#6
#  https://launchschool.com/posts/c9c7c217


#7
paper 
resoning: 
rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
=> rps(rps('paper', 'rock')'rock')
=> rps('paper','rock')
=> paper


#8
no
you can pass a method as a param in another method, but remember : a method only accept one type 
of argument. In the example, "no" is a string, while the return value of foo is also a string, that
is why you can pass foo in bar method 
since 'yes' always equals to true, bar method will return no











