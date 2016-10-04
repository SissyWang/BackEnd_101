number_of_lines = nil
integer = ''

loop do
    
    puts '>> How many output lines do you want? Enter a number >= 3(q to quit):'
    number_of_lines = gets.chomp
    integer = number_of_lines.to_i
    break if number_of_lines.downcase.start_with?('q')
       
    loop do
      break if integer >= 3
      puts ">> That's not enough lines."
    end
    
    while integer > 0
      puts 'Launch School is the best!'
      integer -= 1
    end
    
 end  