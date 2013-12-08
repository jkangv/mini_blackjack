class Card
  attr_reader :value, :suit
  attr_accessor :point

  def initialize(value, suit)
    @value = value
    @suit = suit
    if ["J","Q","K"].include?(@value)
      @point = 10
    elsif @value == "A"
      @point = 11
    else
      @point = @value.to_i
    end
  end

  def card
    card = self.value.to_s + self.suit
    card
  end
end

class Deck
  SUITS = ["♦", "♣", "♥", "♠"]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end

    @collection.shuffle!
  end

  def draw!
    @collection.pop
  end
end
