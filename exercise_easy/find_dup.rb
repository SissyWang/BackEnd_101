# method 1
def find_dup(array)
    index = 0
    while index < array.size
     return array[index] if array.count(array[index]) > 1
     index += 1
    end
end

# method 2
def find_dup(array)
    array.each do |element|
    return element if array.count(element) > 1
    end
end

p find_dup([1,2,3,1])
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) 


# 1. iterate through the array
# 2 - a. keep track of every element that we iterate across and count number of iterations
# 2 - b. identify the first time we iterate over a previously iterated element 
# 3. return the element that satisfies condition 2a or 2b