VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, computer)
  (player == 'rock' && computer == 'paper') ||
    (player == 'paper' && computer == 'scissors') ||
    (player == 'scissors' && computer == 'rock')
end

def return_results(player, computer)
  if win?(player, computer)
    'Computer wins'
  elsif win?(computer, player)
    'You win'
  else
    'Its a tie'
  end
end

choice = ''

loop do
  loop do
    prompt("make a choice from the following: #{VALID_CHOICES.join(',')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('Your choice was not valid,choose again')
    end
  end
  computer_choice = VALID_CHOICES.sample()
  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")
  prompt(return_results(choice, computer_choice))
  prompt('Do you want to play again?(Yes or No)')
  wish = Kernel.gets().chomp()
  break unless wish.downcase.start_with?('y')
end

