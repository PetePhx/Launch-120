module Display
  BANNER = <<-BNR
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
♣  _____                                      ♦
♠ |A .  | _____                               ♣
♥ | /.\\ ||A ^  | ██████╗  ██   _____          ♠
♦ |(_._)|| / \\ | ╚════██╗███║ |A _  | _____   ♥
♣ |  |  || \\ / |  █████╔╝╚██║ | ( ) ||A_ _ |  ♦
♠ |____V||  .  | ██╔═══╝  ██║ |(_'_)||( v )|  ♣
♥        |____V| ███████╗ ██║ |  |  || \\ / |  ♠
♦                ╚══════╝ ╚═╝ |____V||  .  |  ♥
♣                                    |____V|  ♦
♠                                             ♣
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥

♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣         WELCOME TO TWENTY-ONE!          ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥\n
BNR

  RULES_BANNER = "
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥    R U L E S    ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♦
♦                                             ♦
♦ #{'The objective is to get as close to 21'.center(43)} ♦
♦ #{'as possible without going over, i.e.'.center(43)} ♦
♦ #{' getting \'busted\'.'.center(43)} ♦
♦                                             ♦
♦ #{'Number cards 2 to 10 have face values.'.center(43)} ♦
♦ #{'Jack/Queen/King each count as 10. Ace '.center(43)} ♦
♦ #{'counts as 1 or 11, depending on hand.'.center(43)} ♦
♦ #{'Higher hand wins except when busted.'.center(43)} ♦
♦ #{'\'Hit\' to get extra card(s). Otherwise'.center(43)} ♦
♦ #{'simply \'Stay\'.'.center(43)} ♦
♦                                             ♦
♦ #{'Player who wins FIVE (5) rounds wins'.center(43)} ♦
♦ #{'the game. GOOD LUCK!'.center(43)} ♦
♦                                             ♦
♦ #{'Bonus: The \'odds\' option displays'.center(43)} ♦
♦ #{'the odds of win/loss/tie. '.center(43)} ♦
♦                                             ♦
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♦\n\n"

  END_BANNER = '
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣   Thank you for playing 21. Goodbye!    ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥'

  SMALL_BANNER = "\n♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♦"
  WON_BANNER = "\n\n ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ YOU WON! ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥"
  LOST_BANNER = "\n\n♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ YOU LOST! ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠"

  def clear_screen
    system('clear') || system('CLS')
  end

  def display_scores
    puts SMALL_BANNER
    puts "\n" + "SCORES:".center(47) + "\n\n"
    puts "Player: #{scores[:player]}, Dealer: #{scores[:dealer]}".center(47)
    puts SMALL_BANNER
  end

  def display_results(winner)
    puts SMALL_BANNER
    case winner
    when :player
      puts "\n" + "YOU WON THIS ROUND! （╯ʘ‿ʘ)╯ ︵ (\\ .o.)/".center(47)
    when :dealer
      puts "\n" + " You lost this round! (╯°□°)╯ ︵  ┻━┻".center(47)
    when :tie
      puts "\n" + "( ⊙﹏⊙) ⌐═╦╦═─  IT IS A TIE!  🔫 (⊙﹏⊙ )".center(47)
    end
  end

  def display_welcome
    clear_screen
    puts BANNER
    puts "Hit 'Enter' to see rules..."
    gets
    clear_screen
    puts RULES_BANNER
    puts "Hit 'Enter' to begin playing..."
    gets
  end

  def display_goodbye
    puts END_BANNER
  end

  def display_game_winner
    case scores.key(5)
    when :player then puts WON_BANNER
    when :dealer then puts LOST_BANNER
    end
  end
end

module Simulation
  SIM_ROUNDS = 4_000

  def display_odds(player, dealer)
    puts "Estimating the odds... please wait a few seconds..."
    odds = estimate_odds(player, dealer)
    odds_str = odds.map do |arr|
      arr.map { |elm| (elm.round(1).to_s + '%').center(15) }
    end
    ["STAY", "HIT"].each_with_index do |choice, idx|
      puts "
+-----------------------------------------------+
|#{choice.center(47)}|
+---------------+---------------+---------------+
|#{['WIN'.center(15), 'TIE'.center(15), 'LOSE'.center(15)].join('|')}|
+---------------+---------------+---------------+
|#{odds_str[idx].join('|')}|
+---------------+---------------+---------------+"
    end
  end

  def estimate_odds(player, dealer)
    odds_hash = { stay: { player: 0, tie: 0, dealer: 0 },
                  hit: { player: 0, tie: 0, dealer: 0 } }
    [:stay, :hit].each do |choice|
      SIM_ROUNDS.times do
        odds_hash[choice][sim_one_round(player, dealer, choice)] += 1
      end
    end
    odds_hash.values.map(&:values).map do |arr|
      arr.map { |elm| (100 * elm).fdiv(SIM_ROUNDS) }
    end
  end

  def sim_one_round(player, dealer, choice)
    deck = Deck.new
    sim_player = player.deep_copy
    sim_dealer = dealer.deep_copy
    sim_dealer.cards.pop # unknown second card discarded
    deck.cards -= sim_player.cards + sim_dealer.cards # deck updated
    sim_dealer.hit deck # unknown card replaced
    sim_player.hit deck if choice == :hit
    sim_dealer.move(deck)
    sim_winner(sim_player, sim_dealer)
  end

  def sim_winner(player, dealer)
    return :dealer if player.busted?
    return :player if dealer.busted?
    case player.hand_total <=> dealer.hand_total
    when -1 then return :dealer
    when 0  then return :tie
    when 1 then return :player
    end
  end
end

class Card
  attr_reader :rank, :suit
  def initialize(rk, st)
    @rank = rk
    @suit = st
  end

  def to_s
    "[#{suit} #{rank.capitalize} #{suit}]"
  end
end

class Deck
  RANKS = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
           'Ten', 'Jack', 'Queen', 'King', 'Ace']
  SUITS = ['♥', '♦', '♣', '♠']

  attr_accessor :cards

  def initialize
    reset
  end

  def deal
    cards.pop
  end

  def reset
    @cards = []
    RANKS.product(SUITS).each do |rank, suit|
      card = Card.new(rank, suit)
      @cards << card
    end
    @cards.shuffle!
  end
end

class Participant
  VALUES = { Two: 2, Three: 3, Four: 4, Five: 5, Six: 6, Seven: 7, Eight: 8,
             Nine: 9, Ten: 10, Jack: 10, Queen: 10, King: 10, Ace: 11 }
  WIN_THRESHOLD = 21
  attr_accessor :cards

  def initialize
    reset
  end

  def hit(deck)
    cards << deck.deal
  end

  def busted?
    hand_total > WIN_THRESHOLD
  end

  def number_of_aces
    cards.count { |card| card.rank == 'Ace' }
  end

  def hand_total
    total = cards.map { |card| VALUES[card.rank.to_sym] }.sum
    num_aces = number_of_aces
    while num_aces > 0 && total > WIN_THRESHOLD
      num_aces -= 1
      total -= 10
    end
    total
  end

  def reset
    @cards = []
  end

  def deep_copy
    Marshal.load(Marshal.dump(self))
  end
end

class Player < Participant
  def display_cards
    puts "\nYou have: #{cards.join(' and ')}. Your hand total: #{hand_total}"
  end

  def move(deck)
    loop do
      puts "\nHit, Stay or Odds?"
      puts "(Enter 'h' for hit, 's' for stay, 'o' for odds of win/tie/lose):"
      answer = gets.chomp
      case answer.downcase
      when 'h'
        hit deck
        display_cards
      when 'o'
        return :odds
      when 's'
        return(puts "You chose to stay!")
      end
      return(puts "You busted!") if busted?
    end
  end
end

class Dealer < Participant
  DEALER_THRESHOLD = 17
  def display_partial
    puts "\nThe dealer has: #{cards[0]} and an unknown card."
  end

  def display_cards
    puts "The dealer has: #{cards.join(' and ')}. Dealer total: #{hand_total}"
  end

  def move(deck)
    while hand_total < DEALER_THRESHOLD
      hit deck
    end
  end

  def move_and_display(deck)
    move(deck)
    display_cards
    puts "The dealer busted!" if busted?
  end
end

class Game
  include Display
  include Simulation
  attr_reader :player, :dealer, :deck, :scores, :winner

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome
    loop do
      play_one_set
      break unless play_again?
    end
    display_goodbye
  end

  private

  def play_one_set
    @scores = { player: 0, dealer: 0 }
    loop do
      play_one_round
      update_scores
      display_scores
      break if scores.values.max >= 5
      puts "Hit 'Enter' to sart the next round..."
      gets
    end
    display_game_winner
  end

  def play_one_round
    reset
    clear_screen
    deal_initial_cards
    show_initial_cards
    while player.move(deck) == :odds
      display_odds(player, dealer)
      show_initial_cards
    end
    dealer.move_and_display(deck)
    display_results(winner)
  end

  def reset
    deck.reset
    player.reset
    dealer.reset
  end

  def deal_initial_cards
    2.times do
      player.hit deck
      dealer.hit deck
    end
  end

  def show_initial_cards
    dealer.display_partial
    player.display_cards
  end

  def winner
    return :dealer if player.busted?
    return :player if dealer.busted?
    case player.hand_total <=> dealer.hand_total
    when -1 then return :dealer
    when 0  then return :tie
    when 1 then return :player
    end
  end

  def update_scores
    @scores[winner] += 1 if winner != :tie
  end

  def play_again?
    loop do
      puts "\n\n\nWould you like to play again? (y or n)"
      answer = gets.chomp.downcase
      return answer[0] == 'y' if %w[y yes n no].include? answer
      puts "Sorry; 'y' or 'n' please!"
    end
  end
end

Game.new.start
