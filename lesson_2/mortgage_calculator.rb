# simple mortgage calculator

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i > 0
end

def valid_interest_rate?(num)
  num.to_i >= 0
end

# welcome message
prompt("Welcome to Mortgage Calculator!")
prompt("-------------------------------")

# get name
def get_name
  name = ''
  prompt('Please enter your name')

  loop do
    name = gets.chomp

    break unless name.empty?
    prompt("Make sure to enter a valid name")
  end

  name
end

# get loan amount
def get_loan_amount
  loan_amount = ''
  prompt('What is the loan amount?')

  loop do
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)
    prompt('Please enter a valid loan amount,
            amount should be positive & greater than zero')
  end
  loan_amount
end

# get loan duration
def get_loan_duration
  years = ''

  prompt('What is the loan duration (in years)?')
  loop do
    years = gets.chomp

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
    loan_apr = gets.chomp

    break if valid_interest_rate?(loan_apr)
    prompt('Please enter a valid interest rate')
  end
  loan_apr
end

def calculate_monthly_payment(loan_amount, loan_apr, years)
  months = years.to_i * 12

  annual_interest_rate = loan_apr.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12

  if annual_interest_rate != 0
    loan_amount.to_f * (monthly_interest_rate /
                        (1 - (1 + monthly_interest_rate)**(-months)))
  else
    loan_amount.to_f / months
  end
end

def display_monthly_rate(name, monthly_payment)
  prompt("#{name} Your monthly payment is: $#{format('%.2f', monthly_payment)}")
end

def caluclate_again?
  prompt("Another calculation?")
  answer = gets.chomp

  %w(y yes).include?(answer)
end

name = get_name

loop do
  loan_amount = get_loan_amount
  years = get_loan_duration
  loan_apr = get_loan_apr

  monthly_payment = calculate_monthly_payment(loan_amount, loan_apr, years)

  display_monthly_rate(name, monthly_payment)

  break unless caluclate_again?
  system('clear')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye! #{name}")
