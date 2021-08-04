# simple mortgage calculator

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i > 0
end

# welcome message
prompt("Welcome to Mortgage Calculator!")
prompt("-------------------------------")

# get name
def get_name
  name = ''
  prompt('Please enter your name')

  loop do
    name = Kernel.gets().chomp()

    if name.empty?()
      prompt("Make sure to enter a valid name")
    else
      break
    end
  end
  name
end

# get loan amount
def get_loan_amount
  loan_amount = ''
  prompt('What is the loan amount?')

  loop do
    loan_amount = Kernel.gets().chomp

    break if valid_number?(loan_amount)
    prompt('Please enter a valid loan amount')
  end
  loan_amount
end

# get loan duration
def get_loan_duration
  years = ''

  prompt('What is the loan duration (in years)?')
  loop do
    years = Kernel.gets().chomp()

    break if valid_number?(years)
    prompt('Please enter a valid loan duration')
  end
  years
end

# get APR
def get_loan_apr
  loan_apr = ''

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  loop do
    loan_apr = Kernel.gets().chomp()

    break if valid_number?(loan_apr)
    prompt('Please enter a valid interest rate')
  end
  loan_apr
end

def caluclate_monthly_payment(loan_amount, loan_apr, years)
  months = years.to_i() * 12

  annual_interest_rate = loan_apr.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-months)))
end

def display_monthly_rate(name, monthly_payment)
  prompt("#{name} Your monthly payment is: $#{format('%.2f', monthly_payment)}")
end

loop do
  name = get_name
  loan_amount = get_loan_amount
  years = get_loan_duration
  loan_apr = get_loan_apr

  monthly_payment = caluclate_monthly_payment(loan_amount, loan_apr, years)

  display_monthly_rate(name, monthly_payment)

  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
