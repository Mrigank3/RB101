def prompt(message)
  Kernel.puts("=> #{message}")
end

def number_valid(number)
  number.to_f.to_s == number || number.to_i.to_s == number
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

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect
loop do
  prompt(MESSAGES['welcome'])
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if number_valid(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if number_valid(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
  prompt(MESSAGES['message'])
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w( 1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_option'])
    end
  end
 prompt("#{operation_to_message(operator)} the two numbers ...")
 result = case operator
          when '1'
            number1.to_i + number2.to_i
          when '2'
            number1.to_i - number2.to_i
          when '3'
            number1.to_i * number2.to_i
          else
            number1.to_f / number2.to_f
          end
  Kernel.puts(result)
  prompt(MESSAGES['wish'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end