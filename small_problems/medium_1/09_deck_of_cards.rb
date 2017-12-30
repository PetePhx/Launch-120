=begin

Deck of Cards

Using the Card class from the previous exercise, create a Deck class that
contains all of the standard 52 playing cards. Use the following code to start
your work:

The Deck class should provide a #draw method to draw one card at random. If the
deck runs out of cards, the deck should reset itself by generating a new set of
52 cards.

Examples:

Note that the last line should almost always be true; if you shuffle the deck
1000 times a second, you will be very, very, very old before you see two
consecutive shuffles produce the same results. If you get a false result, you
almost certainly have something wrong.

=end

# We use #product to form the cartesian product of the ranks and suits,
# supplying the resulting array to map with Car.new to form an array of Card
# bjexts, and then shuffle. #draw simply pops from the array if any card is
# present, otherwise build a new deck and pops.

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    build_deck
  end

  def build_deck
    @deck = RANKS.product(SUITS).map { |rk, st| Card.new(rk, st) }.shuffle
  end

  def draw
    @deck.any? ? @deck.pop : build_deck.pop
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit
  RANK_HASH = {
    2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9,
    10 => 10, 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    RANK_HASH[@rank] <=> RANK_HASH[other.rank]
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
