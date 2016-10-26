def reverse(array)
    new_array = []
    index = array.size - 1
    while index >= 0
      new_array << array[index]
     index -= 1
 end
   new_array
end

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b c d e)) == %w(e d c b a)  
p reverse(['abc']) == ['abc']              
p reverse([]) == []  


# method 2
# index = -1
# while index > - (array.size + 1)
#   puts array[index]
#   index -= 1