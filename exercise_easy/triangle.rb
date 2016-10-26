SPACE = ' '
STAR = '*'

def trangel(n)
  var = n
    loop do
        puts SPACE * (var - 1) + STAR * (n - var + 1)
        var -= 1
        break if var == 0
    end
end

puts trangel(50)

#1. figure our the relation between space and stars 
#2. fugure out how to draw it on to the screen

