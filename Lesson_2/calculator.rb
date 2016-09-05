# ask the users for 2 numbers 
# ask the user for an operation to perform 
# perform the operation on the 2 numbers
#output the result

#answer=Kernel.gets()
#Kernel.puts(answer)
def prompt(message)
  Kernel.puts("=> #{message}")
end 

def valid_number?(num)
  num.to_i() != 0
end 

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when '2'
    'Substracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end 
end 


prompt("Welcome to Calculator! Enter your name: ")
name = ''

loop do
name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name")
  else 
    break
  end 
end 


prompt("Hi #{name}!")

loop do #main loop
number1 = ''

loop do
prompt("What's the firt number?")
number1=Kernel.gets().chomp()

  if valid_number?(number1)
  break
  else
  prompt("Hm, that doesnt look like a valid number")
  end 
end

number2 = ''
loop do 
prompt("What's the second number?")
number2=Kernel.gets().chomp()

  if valid_number?(number2)
    break
  else 
    prompt("Hm, that doesnt look like a valid number")
  end 
end 

operator_promot = <<-MSG
    What operation would you like to perform?
    1) add
    2) substract
    3) multiply
    4) divide
  MSG

  prompt(operator_promot)


operator = ''
loop do 
  operator = Kernel.gets().chomp()

  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1,2,3 or 4")
  end 
end 

prompt("#{operation_to_message(operator)}the two numbers...")

result = case operator
   when "1"
    number1.to_i() + number2.to_i()
   when "2"
    number1.to_i() - number2.to_i()
   when "3"
    number1.to_i() * number2.to_i()
   when "4"
    number1.to_f() / number2.to_f()
  end 


prompt("The result is #{result}")

  prompt("do you want to perform another calculation?(Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')


prompt ("Thank you for using the calculator. Good bye!")

end 


#Things to think about 
# 1) Is there a better way to validate that the user has input a number? We'll cover this in more detail in a future assignment.
#    We can also use Integer(gets). number=Integer(gets) rescue false 
# 2) to_f:Returns the result of interpreting leading characters in str as a floating point number. Extraneous characters past the end of a valid number are ignored. If there is not a valid number at the start of str, 0.0 is returned. This method never raises an exception.
#    to_i: Returns the result of interpreting leading characters in str as an integer base base (between 2 and 36). Extraneous characters past the end of a valid number are ignored. If there is not a valid number at the start of str, 0 is returned. This method never raises an exception when base is valid.
# 6) The Kernel module is included by class Object, so its methods are available in every Ruby object.
#    The Kernel instance methods are documented in class Object while the module methods are documented here. These methods are called without a receiver and thus can be called in functional form