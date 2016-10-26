def half(array)
    return [[], []] if array == []
    return [[array[0]], []] if array.size == 1    
    num = (array.size.to_f/2.to_f).ceil
    array.each_slice(num).to_a
end

p half([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p half([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p half([5]) == [[5], []]
p half([]) == [[], []]
