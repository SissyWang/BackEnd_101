# Method 1
def ascii_value(string)
    value = 0
    string.each_char do |word|
        value += word.ord
    end
    value
end

# Method 2
def ascii_value(string)
    value = 0
    string.split('').each do |word|
        value += word.ord
    end
    value
end

p ascii_value('Launch School')