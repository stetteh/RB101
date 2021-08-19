# Rock Paper Scissors
VALID_CHOICES = %w(rock paper scissors lizard spock)
WINNING_COMBOS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_choices(first, second)
  prompt("You chose #{first} and Computer chose #{second}")
end

def win?(first, second)
  WINNING_COMBOS[first.to_sym].include?(second)
end

def display_choice_result(player, computer)
  if win?(player, computer)
    prompt('Player wins')
  elsif win?(computer, player)
    prompt('Computer wins')
  else
    prompt('its a tie')
  end
end

def player_play
  player_choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = Kernel.gets().chomp().downcase()

    break if VALID_CHOICES.include?(player_choice)
    prompt("That's not a valid choice")
  end

  player_choice
end

def computer_play
  VALID_CHOICES.sample
end

def game_method_calls
  player_choice = player_play
  computer_choice = computer_play
  display_choices(player_choice, computer_choice)
  win?(player_choice, computer_choice)
  display_choice_result(player_choice, computer_choice)

  return player_choice, computer_choice
end

def game_play
  player_wins = 0
  computer_wins = 0

  loop do
    player_choice, computer_choice = game_method_calls

    if win?(player_choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, player_choice)
      computer_wins += 1
    end

    prompt("Players Score #{player_wins}, Computers Score #{computer_wins}")
    break if player_wins == 3 || computer_wins == 3
  end

  player_wins
end

def game_winner(player_wins)
  prompt('---------------------------')
  prompt('---------------------------')
  if player_wins == 3
    prompt("Congratulations! You won")
  else
    prompt("Computer Won the game")
  end
end

def play_again?
  prompt("Another Game?")
  answer = gets.chomp

  %w(y yes).include?(answer)
end

loop do
  player = game_play
  game_winner(player)

  break unless play_again?
  system('clear')
end

prompt("Thanks for playing!")
prompt("Good bye!")
