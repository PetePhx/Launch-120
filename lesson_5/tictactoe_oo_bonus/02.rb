=begin

Allow the player to pick any marker.

=end

module UiUx

  FIRST_PLAYER = :human # one of [:human, :computer, :choose]
  HUMAN_MARKER = :choose # one of ["X" or :choose]
  COMPUTER_MARKER = 'O'

  BANNER = '
   _______  _           _______                  _______
  (_______)(_)         (_______)                (_______)
      _     _   ____       _     _____   ____       _      ___   _____
     | |   | | / ___)     | |   (____ | / ___)     | |    / _ \ | ___ |
     | |   | |( (___      | |   / ___ |( (___      | |   | |_| || ____|
     |_|   |_| \____)     |_|   \_____| \____)     |_|    \___/ |_____)
  '

  def prompt(msg)
    puts "=> #{msg}"
  end

  def clear
    system('clear') || system('CLS')
  end

  def display_welcome
    clear
    prompt "Welcome to...\n\n"
    puts BANNER + "\n\n"
    prompt "+====================== R U L E S ====================+"
    prompt "|                                                     |"
    prompt "|       Try to get three markers in a sequence:       |"
    prompt "|                                                     |"
    prompt "|               row / column / diagonal               |"
    prompt "|                                                     |"
    prompt "|   First one to win FIVE rounds wins the game!  :)   |"
    prompt "|                                                     |"
    prompt "+=====================================================+"
    prompt ""
    prompt "Hit 'Enter' to begin..."
    gets
  end

  def first_player
    case FIRST_PLAYER
    when :choose
      prompt_first_player
    else
      FIRST_PLAYER
    end
  end

  def prompt_first_player
    prompt "Please select who plays first! player (p) or computer (c):"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if %w[p player c computer].include?(answer)
      puts "The only choices are player and computer. (p or c)"
    end
    case answer
    when 'p', 'player' then :human
    when 'c', 'computer' then :computer
    end
  end

  def set_player_marker
    case HUMAN_MARKER
    when :choose then prompt_player_marker
    else HUMAN_MARKER
    end
  end

  def prompt_player_marker
    puts
    prompt "Please select the symbol you'd like to use."
    prompt "You can choose any letter from 'A' to 'Z', except 'O'."
    prompt "Hit 'Enter' for the default 'X': "
    loop do
      answer = gets.chomp.upcase
      return 'X' if answer.empty?
      return answer if ('A'..'Z').cover?(answer) && answer != 'X'
      prompt "Sorry, choose a letter A to Z except O, or just press enter."
    end
  end

  def clear_and_display(board)
    clear
    draw(board)
  end

  def draw(brd)
    puts ""
    3.times do |r|
      puts "     |     |"
      puts "  #{brd[3 * r + 1]}  |  #{brd[3 * r + 2]}  |  #{brd[3 * r + 3]}"
      puts "     |     |"
      puts "-----+-----+-----" if r < 2
    end
    puts ""
  end

  def prompt_human_move(keys)
    puts "Choose a square (#{joinor(keys)}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if keys.include? square
      puts "Sorry, that's not a valid choice!"
    end
    square
  end

  def joinor(arr, delim = ', ', word = 'or')
    case arr.size
    when 0 then ''
    when 1 then arr[0].to_s
    when 2 then arr.join(" #{word} ")
    else
      arr[0..-2].join(delim) + delim + word + ' ' + arr[-1].to_s
    end
  end

  def display_result(winner, hsh)

    case winner
    when :human then puts "You won!"
    when :computer then puts "The computer won!"
    else
      puts "It's a tie!"
    end
    puts
    display_scores(hsh)
    if hsh.values.max < 5
      prompt "press 'enter' to start the next round..."
      gets
    end
  end

  def display_scores(hsh)
    puts "+----------+------------+"
    puts "|  PLAYER  |  COMPUTER  |"
    puts "+----------+------------+"
    puts "|    #{hsh[:human]}     |     #{hsh[:computer]}      |"
    puts "+----------+------------+"
    puts
  end

  def display_final_winner(scores_hsh)
    winner = scores_hsh.key(5)
    case winner
    when :human then prompt "YOU ARE THE GRAND WINNER!"
    when :computer then prompt "Computer is the grand winner... not you!"
    end
    puts
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y or n)"
      answer = gets.chomp.downcase
      break if %w[y n].include? answer
      puts "Sorry; 'y' or 'n' please!"
    end
    display_play_again_message if answer == 'y'
    answer == 'y'
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
    prompt "press 'enter' to start the next round..."
    gets
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

class Board
  attr_reader :squares
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

  def [](key)
    @squares[key].marker
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
    @squares.values.map(&:marker).uniq - [Square::INITIAL_MARKER]
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

  def next_winning_square(marker)
    unmarked_keys.each do |key|
      next_board = self.deep_copy
      next_board[key] = marker
      return key if next_board.winning_marker
    end
    nil
  end

  def next_risk_square(marker)
    opponent_marker = (find_markers - [marker]).first
    next_winning_square(opponent_marker)
  end

  def deep_copy
    other_board = Board.new
    (1..9).each { |key| other_board[key] = self[key] }
    other_board
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
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

class Human < Player
  include UiUx
  def move(board)
    square = prompt_human_move(board.unmarked_keys)
    board[square] = marker
  end

  def set_marker
    @marker = set_player_marker
  end
end

class Computer < Player
  def move(board)
    winning_square = board.next_winning_square(marker)
    risk_square = board.next_risk_square(marker)
    square = if !winning_square.nil?
               winning_square
             elsif !risk_square.nil?
               risk_square
             elsif board.unmarked_keys.include? 5
               5
             else
               board.unmarked_keys.sample
             end
    board[square] = marker
  end
end

class TTTGame
  include UiUx

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new('')
    @computer = Computer.new(COMPUTER_MARKER)
    @scores = {}
  end

  def play
    display_welcome
    @first_player = first_player
    human.set_marker
    loop do
      play_one_set
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def play_one_set
    reset_scores
    loop do
      play_one_round
      break if @scores.values.max >= 5
    end
    display_final_winner(@scores)
  end

  def play_one_round
    reset
    @current_player = @first_player
    loop do
      clear_and_display(board)
      current_player_moves
      break if board.someone_won? || board.full?
      clear_and_display(board) if human_turn?
    end
    clear_and_display(board)
    update_scores(winner) if winner
    display_result(winner, @scores)
  end

  def reset_scores
    @scores = { human: 0, computer: 0 }
  end

  def winner
    case board.winning_marker
    when human.marker then :human
    when computer.marker then :computer
    else
      nil
    end
  end

  def update_scores(winner)
    @scores[winner] += 1
  end

  def human_turn?
    @current_player == :human
  end

  def current_player_moves
    case @current_player
    when :human then human.move(board)
    when :computer then computer.move(board)
    end
    alternate_player
  end

  def alternate_player
    @current_player = case @current_player
                      when :human then :computer
                      when :computer then :human
                      end
  end

  def reset
    board.reset
    @current_player = FIRST_PLAYER
    clear
  end
end

game = TTTGame.new
game.play
