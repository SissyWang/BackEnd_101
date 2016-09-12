#1
1
2
2
3

#2
! or ? are just part of a method name, you can not judge what they do only base on that

  1) != means not euqals to. For example, 3 != 5 means 3 not equals to 5 
  2) ! before things means "opposite". For example, if user_name = true, !user_name = false 
  3) ! after method could mean this method "mutate" the original variable, but this is not always the case. 
  4) ？：mean ternary operater (if..else). But except that, I dont really know other examples. 
  5) Example: .include?('y') means to check if y is inside a certain variable. 
  6) !! before things turn that thing into its boolean equivalent. !user_name = true 

#3 
advice.sub! 'important','urgent'
# I see in the solution, it used gsub instead of sub. But I tried to use sub and it worked. 
# The different between sub and gsub is, g means global. So gsub gonna change the word globally. 

#4
delete_at(1) means delete the number at the first index place. And since index begin from 0, 1 means the second number
delete(1) means delete the element 1 in the array

#5
There are two ways to do that: (10..100).cover?(42) or (10..100).include?(42)
The difference between .cover? and .include? is: .cover return true even when only a part of the thing is same. 
for example: ('a'..'z').cover?('yellow')=>true. ('a'..'z').cover?('y12345')=>true. as long as 'y' is included from a to z, then it is true. 
However,  ('a'..'z').include?('y12345')=>false. Because 12345 is not included from a to z. 

#6
method 1: famous_words.insert(0,'Four score and ')
method 2: "Four score and " << famous_words
method 3: famous_words.prepend("Four score and")

#7
42
The eval method removes the string component and evaluates it inside. So after eval the long string, it recursively calls itself. 
we first defined number = 2, and there is a method says add_eight returns number + 8
so the inner add_eight(number),after removed the string quality, became a method, add_eight(2), equals 2+8, equals to 10
the second layer become 10+8=18
the third layer become 18+8=26
the fourth layer become 26+8=34
the last layer become 34+8=42

#8
flintstones.flatten!

#9
flintstones.assoc('Barney')

#10
new_hash = {}
flintstones.each_with_index do |name, index|
  new_hash[name] = index
end
