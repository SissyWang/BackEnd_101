def combine(array1, array2)
    new_array = []
    new_array << array1
    new_array << array2
    new_array = new_array.flatten
    new_array.uniq
end

p combine([1, 3, 5], [3, 6, 9]) 
