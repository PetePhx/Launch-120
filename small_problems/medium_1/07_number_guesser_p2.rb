=begin

Number Guesser Part 2

In the previous exercise, you wrote a number guessing game that determines a
secret number between 1 and 100, and gives the user 7 opportunities to guess the
number.

Update your solution to accept a low and high value when you create a
GuessingGame object, and use those values to compute a secret number for the
game. You should also change the number of guesses allowed so the user can
always win if she uses a good strategy. You can compute the number of guesses
with:

Math.log2(size_of_range).to_i + 1

Note that a game object should start a new game with a new number to guess with
each call to #play.

=end

# A) We update the GuessingGame class to accept min and max for the range in
# initialization instead of a fixed range. We also calculate the initial number
# of guesses based on the given formula and the size of the range.

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
      puts "Invalid guess. Enter a number between #{rng.min} and #{rng.max}."
    end
    guess.to_i
  end

  def display_too_high
    puts "\nYour guess is too high!"
  end

  def display_too_low
    puts "\nYour guess is too low!"
  end

  def display_win
    puts "\nYou Won!"
  end

  def display_loss
    puts "\nYou are out of guesses. You lost!"
    puts
  end
end

class GuessingGame
  include UiUx
  DECISION_HASH = { -1 => 'low', 0 => 'correct', 1 => 'high' }

  def initialize(min, max)
    @range = min..max
    max_guesses = calculate_max_guess(@range.size)
    @remaining_guesses = max_guesses
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
    @number = rand(@range.size) + @range.min
  end

  def calculate_max_guess(range_size)
    Math.log2(range_size).to_i + 1
  end

  def decide_outcome(guess)
    DECISION_HASH[guess <=> @number]
  end

  def play_one_cycle
    display_remaining @remaining_guesses
    display_query @range
    guess = receive_input @range
    case decide_outcome(guess)
    when "correct" then "win"
    when "low" then display_too_low
    when "high" then display_too_high
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
