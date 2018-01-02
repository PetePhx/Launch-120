=begin

The next improvement we'll make is related to our most complicated method:
Board#winning_marker. The problem with this method is that it relies on
knowledge of both the human and computer markers. This doesn't feel quite right.
Why does the Board class have to know about specific markers in the TTTGame
class? A board object contains the state of the board. It's responsible for
knowing things related to a board: whether all squares are marked, how to draw
itself, how many empty squares are left, and whether a marker has won. The goal
of Board#winning_marker is to return some winning marker or nil, but in our
implementation, we hardcoded the human and computer markers. This board's
implementation is tied to the implementation of TTTGame class. But in this case,
that's not necessary. We should change the implementation of Board#winning_marker
to see if any marker, not just the human or computer's, has won. If so, return
that marker, and if not, return nil.

=end

# A) we right a new method #find_markers to find all the markers in the board
# except the initial marker. Next we get rif og the count_human_marker and
# count_computer_marker, replacing them with #count_marker that accepts a marker
# argument, and returns the count. Whithin the #winning_marker, we find_markers
# and then iterate over the lines as well as markers, returning the winning
# marker if any, and nil otherwise. 

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_marker(squares, marker)
    squares.map(&:marker).count(marker)
  end

  def find_markers
    markers = @squares.values.map(&:marker).uniq - [Square::INITIAL_MARKER]
  end

  def winning_marker
    markers = find_markers
    WINNING_LINES.each do |line|
      markers.each do |mk|
        if count_marker(@squares.values_at(*line), mk) == 3
          return mk
        end
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end

end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear
    system('clear') || system('CLS')
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    board.draw
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include? square
      puts "Sorry, that's not a valid choice!"
    end
    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "The computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play
    clear
    display_welcome_message

    loop do
      display_board

      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.someone_won? || board.full?

        clear_screen_and_display_board
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

end

game = TTTGame.new
game.play
