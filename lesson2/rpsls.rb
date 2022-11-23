OPTIONS = %w(rock paper scissors lizard spock)

OPTIONS_ABR = %w(r p sc l sp)

WIN_HASH = {
  'rock' => ['scissors', 'lizard'],
  'r' => ['scissors', 'lizard'],
  'paper' => ['spock', 'rock'],
  'p' => ['spock', 'rock'],
  'scissors' => ['paper', 'lizard'],
  'sc' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'sp' => ['rock', 'scissors'],
  'lizard' => ['spock', 'paper'],
  'l' => ['spock', 'paper']
}

ABR_HASH = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

MESSAGES = {
  'welcome' => "Welcome to #{OPTIONS.join(',')}.",
  'rules' => "Do you want to know the rules? (Answer with yes or no).",
  'void_choice' => "Seems like you did not type anything.Try again.",
  'Invalid_answer' => "This is not a valid choice.",
  'choosing_options' => "Choose one from #{OPTIONS.join(',')}.",
  'sp_or_sc' => "Enter sp for spock OR sc for scissors.",
  'play_again' => "Hit enter to play another round OR type 'no' to end.",
  'thank_you' => "Thank you for playing #{OPTIONS.join(',')}."
}

RULES =
  <<-MSG
--------------------------------------------
   Below are the rules of #{OPTIONS.join(',')}.
  .scissor cuts paper
  .paper covers rock
  .rock crushes lizard
  .lizard poisons spock
  .spock smashes scissors
  .scissors decapitate lizard
  .lizard eats paper
  .paper disproves spock
  .spock vaporizes rock,rock crushes scissors.
---------------------------------------------
  MSG

def prompt(display)
  Kernel.puts("=>#{display}")
end

def return_results(hash, first_choice, second_choice)
  if hash[first_choice].include?(second_choice)
    'You win this round.'
  elsif first_choice == second_choice
    'Its a tie'
  else
    'Computer wins this round.'
  end
end

prompt(MESSAGES['welcome'])

prompt(MESSAGES['rules'])

player_win = 0

computer_win = 0

ties = 0

rules_answer = ' '

loop do
  rules_answer = Kernel.gets().chomp().downcase
  if rules_answer.empty?
    prompt(MESSAGES['void_choice'])
  elsif rules_answer == 'yes'
    prompt(RULES)
    prompt('Hit Enter to start!')
    Kernel.gets().chomp()
    break
  elsif rules_answer == 'no'
    break
  else
    prompt(MESSAGES['Invalid_answer'])
  end
end

loop do
  choice = ''

  prompt(MESSAGES['choosing_options'])

  loop do
    choice = Kernel.gets().chomp().downcase

    if OPTIONS.include?(choice)
      break
    elsif OPTIONS_ABR.include?(choice)
      choice = ABR_HASH[choice]
      break
    elsif choice.empty?
      prompt(MESSAGES['void_choice'])
    elsif choice.downcase == 's'
      prompt(MESSAGES['sp_or_sc'])
    else
      prompt(MESSAGES['Invalid_answer'])
    end
  end

  computer_choice = OPTIONS.sample()

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  prompt(return_results(WIN_HASH, choice, computer_choice))

  if return_results(WIN_HASH, choice, computer_choice) == 'You win this round.'
    player_win += 1
  elsif return_results(WIN_HASH, choice, computer_choice) == 'Computer wins this round.'
    computer_win += 1
  else
    ties += 1
  end

  scoreboard =
    <<-SCORE
  ------------------------------
  You  - #{player_win}
  Computer - #{computer_win}
  Ties - #{ties}
  ------------------------------
  SCORE

  prompt(scoreboard)

  if player_win == 3
    prompt('You are the Grand Winner')
    break
  elsif computer_win == 3
    prompt('Computer is the Grand Winner')
    break
  end

  prompt(MESSAGES['play_again'])

  play_again_answer = Kernel.gets().chomp().downcase

  if play_again_answer == 'no'
    prompt('Final Score')
    prompt(scoreboard)
    prompt(MESSAGES['thank_you'])
    break
  end
end
