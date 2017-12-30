=begin

Number Guesser Part 1

Create an object-oriented number guessing class for numbers in the range 1 to
100, with a limit of 7 guesses per game. The game should play like this:

Note that a game object should start a new game with a new number to guess with
each call to #play.

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
You win!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low
You are out of guesses. You lose.

=end

module UiUx
  def display_remaining(rem_guess)
    puts "You have #{rem_guess} guess#{rem_guess == 1 ? '' : 'es'} remaining."
  end

  def display_query(rng)
    print "Enter a number between #{rng.min} and #{rng.max}: "
  end

  def receive_input(rng)
    guess = nil
    loop do
      guess = gets.chomp
      break if rng.cover? guess.to_i
      puts "Please enter a number between #{rng.min} and #{rng.max}."
    end
    guess.to_i
  end

  def display_too_high
    puts "Your guess is too high!"
  end

  def display_too_low
    puts "Your guess is too low!"
  end

  def display_win
    puts "You won!"
  end

  def display_loss
    puts "You are out of guesses. You lost!"
  end
end

class GuessingGame
  include UiUx
  RANGE = 1..100
  MAX_GUESSES = 7
  DECISION_HASH = { -1 => 'low', 0 => 'correct', 1 => 'high' }

  def initialize
    @remaining_guesses = MAX_GUESSES
  end

  def play
    initialize_secret_number
    while @remaining_guesses > 0
      @result = play_one_cycle
      return display_win if @result == "win"
      @remaining_guesses -= 1
    end
    display_loss
  end

  private

  def initialize_secret_number
    @number = rand(RANGE.size) + RANGE.min
  end

  def decide_outcome(guess)
    DECISION_HASH[guess <=> @number]
  end

  def play_one_cycle
    display_remaining @remaining_guesses
    display_query RANGE
    guess = receive_input RANGE
    case decide_outcome(guess)
    when "correct" then "win"
    when "low" then display_too_low
    when "high" then display_too_high
    end
  end
end

game = GuessingGame.new
game.play

# Further Exploration

# We took a straightforward approach here and implemented a single class. Do you
# think it's a good idea to have a Player class? What methods and data should be
# part of it? How many Player objects do you need? Should you use inheritance, a
# mix-in module, or a collaborative object?

# A) Since there is only one player, it wouldn't make much sense to have a
# player class. We have separated the interactive parts of the program to a UiUx
# mixin module.
