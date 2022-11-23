def prompt(message)
  Kernel.puts("=>#{message}")
end

require 'yaml'
MESSAGES = YAML.load_file('clcal.yml')
puts MESSAGES.inspect

def invalid_message
  prompt(MESSAGES['invalid_message'])
end

def amount_valid(amount)
  (amount.to_f.to_s == amount || amount.to_i.to_s == amount) && (amount.to_f > 0)
end
amount = ''
years = ''
apr = ''
prompt(MESSAGES['welcome'])
loop do
  prompt(MESSAGES['loan_amount'])
  loop do
    amount = Kernel.gets().chomp()
    if amount_valid(amount)
      break
    else
      invalid_message
    end
  end
  prompt(MESSAGES['loan_duration'])
  loop do
    years = Kernel.gets().chomp()
    if amount_valid(years)
      break
    else
      invalid_message
    end
  end
  prompt(MESSAGES['APR'])
  loop do
    apr = Kernel.gets().chomp()
    if amount_valid(apr)
      break
    else
      invalid_message
    end
  end
  apr1 = apr.to_f / 100
  months = (years.to_f) * 12
  monthly_rate = apr1 / 12
  prompt("the number of months is #{months}")
  monthly_payment = amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(-months)))
  prompt(monthly_payment)
  result = <<-MSG
  The monthly interest rate is #{format('%0.3f',monthly_rate * 100)} %
  The loan duration in months is #{months}
  The monthly payment is #{format('%0.3f',monthly_payment)}
  MSG
  prompt(result)
  prompt(MESSAGES['wish'])
  answer = Kernel.gets().chomp()
  unless answer.start_with?('y')
    break
  end
end
