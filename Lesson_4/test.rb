# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"


def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1 # arr[-1] permanently mutating the last element in the arr
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter) # arr.size still == 3, because there is 1,2,3. and arr[-1] mutating the last element, but not deleting it. so there is still 3 elements. 
                                                      # if arr.size ==2, just join them together. if not, put , in between
end

puts joinor([1,2,3,4,5,6,7,8],';','and')



