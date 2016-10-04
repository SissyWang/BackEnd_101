def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

answer1 = ''
loop do
puts ">> Please enter a positive or negative integer:"
answer1 = gets.chomp
    if valid_number?(answer1) == false
        puts ">> Invalid input. Only non-zero integers are allowed."
    else
        break
    end
end

answer2 = ''
    loop do
    puts ">> Please enter a positive or negative integer:"
    answer2 = gets.chomp
        if answer1.to_i < 0 && answer2.to_i < 0
            puts ">> Sorry. One integer must be positive, one must be negative.
                  >> Please start over."
        elsif answer1.to_i > 0 && answer2.to_i > 0
            puts ">> Sorry. One integer must be positive, one must be negative.
                  >> Please start over."
        elsif valid_number?(answer2) == false
            puts ">> Invalid input. Only non-zero integers are allowed."
        else 
            break
        end 
    end 