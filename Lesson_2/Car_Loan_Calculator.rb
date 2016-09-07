# monthly interest rate = APR/12
# m = p * (j / (1 - (1 + j)**-n))
# Psuedo
#  - ask for the 3 peices of info
#  - make sure those info are valid numbers
#  - calculate monthly rate: APR/12
#  - calculate loan duration: year*12
#  - print out the result

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

puts "Welcome to car loan calculator, let's calculate! "

loop do
  loan_amount = ''
  loop do
    puts "Tell me the loan amount you have: "
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_f > 0
      break
    else
      puts "Hm, this is not a valid number, remember to put in positive numbers"
    end
  end

  apr = ''
  loop do
    puts "Tell me the APR(example: 0.05 for 5% or 0.025 for 2.5%): "
    apr = gets.chomp
    if valid_number?(apr) && apr.to_f > 0
      break
    else
      puts "Hm, this is not a valid number, remember to put in positive numbers"
    end
  end

  duration = ''
  loop do
    puts "Tell me the loan duration in years:"
    duration = gets.chomp
    if valid_number?(duration) && duration.to_f > 0
      break
    else
      puts "Hm, this is not a valid number, remember to put in positive numbers"
    end
  end

  monthly_rate = apr.to_f / 12
  duration_month = duration.to_i * 12
  monthly_payment = loan_amount.to_f * (monthly_rate.to_f /
                    (1 - (1 + monthly_rate.to_f)**-duration_month.to_i))
  puts("your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  puts "Do you want to calculate again?(Y for yes)"
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')

  puts "Thanks for using this car loan calculator"
end
