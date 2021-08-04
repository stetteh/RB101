# ask the user for two numbers
# ask the user for an operation to peform
# perform the operation on the two numbers
# output the results

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to Calculator! Enter your name:')

# get name
name = ''
loop do
  name = Kernel.gets().chomp().upcase()

  if name.empty?()
    prompt("Make sure to enter a valid name")
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  # first number
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmmm... that doesnt look like a valid number")
    end
  end

  # second number
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmmm... that doesnt look like a valid number")
    end
  end

  # operator
  operator_prompt = <<-MSG
  What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4)divide
  MSG

  operator = ''
  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1 2 3 or 4")
    end
  end

  # perform operation
  prompt("#{operation_to_message(operator)} the two number")
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  # display
  prompt("The result is #{result}")

  # repeat
  prompt('Do you want to perform another calculation (Y to calculate again)')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using calcualtor. GoodBye! #{name}")
