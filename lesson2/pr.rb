WIN_CONDITIONS = {
  'rock' => { abbreviation: 'r', beats: ['scissors', 'lizard'] },
  'scissors' => { abbreviation: 'sc', beats: ['lizard', 'paper'] },
  'spock' => { abbreviation: 'sp', beats: ['scissors', 'rock'] },
  'lizard' => { abbreviation: 'l', beats: ['spock', 'paper'] },
  'paper' => { abbreviation: 'p', beats: ['rock', 'spock'] }
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_result(player, computer)
  if WIN_CONDITIONS.dig(player, :beats).include?(computer)
    prompt("You won!")
  elsif WIN_CONDITIONS.dig(computer, :beats).include?(player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def convert_short_answer(choice)
  if WIN_CONDITIONS.keys.include?(choice)
    choice
  elsif choice == 's'
    choice
  else
    answer = (WIN_CONDITIONS.select do |_, value|
                value[:abbreviation] == choice
              end).keys.first
    answer
  end
end

def get_answer(choice)
  loop do
    prompt("Choose one: #{WIN_CONDITIONS.keys.join(', ')}")
    choice = convert_short_answer(Kernel.gets().downcase.chomp())

    if WIN_CONDITIONS.keys.include?(choice)
      break
    elsif choice == 's'
      prompt("Please enter 'sc' for scissors or 'sp' for spock.")
    else
      prompt("That's not a valid choice.")
    end
  end
  choice
end

def end_game(player_wins, computer_wins)
  if player_wins == 3
    prompt("Player crowned Grand Champion.")
  elsif computer_wins == 3
    prompt("Computer's tired of winning.")
  end
end

instructions = <<-INSTRUCTIONS
---------The rules of the game---------
---------------------------------------
The first to 3 wins is crowned champion
Win conditions are as follows:
• Scissors cuts Paper
• Paper covers Rock
• Rock crushes Lizard
• Lizard poisons Spock
• Spock smashes Scissors
• Scissors decapitates Lizard
• Lizard eats Paper
• Paper disproves Spock
• Spock vaporizes Rock
• Rock crushes Scissors
---------------------------------------
------Enter any key to start game------
INSTRUCTIONS

player_wins = 0
computer_wins = 0
ties = 0

system('clear')
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("Would you like to see the rules of the game?")
answer = Kernel.gets().downcase().chomp()

if answer.start_with?('y')
  puts instructions
  gets.chomp
end

loop do
  system("clear")
  choice = get_answer(choice)
  computer_choice = WIN_CONDITIONS.keys.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  if WIN_CONDITIONS.dig(choice, :beats).include?(computer_choice)
    player_wins += 1
  elsif WIN_CONDITIONS.dig(computer_choice, :beats).include?(choice)
    computer_wins += 1
  else
    ties += 1
  end

  score_board = <<-MSG
----------------SCORE BOARD--------------------
-----------------------------------------------
  •  Player's Score:    #{player_wins}
  •  Computer's Score:  #{computer_wins}
  •  Number of Draws:   #{ties}
-----------------------------------------------
  MSG
  puts score_board

  end_game(player_wins, computer_wins)
  break if player_wins == 3 || computer_wins == 3

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, Good Bye!")