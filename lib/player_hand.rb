class PlayerHand
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def any_eleven?
    @hand.any? {|card| card.point == 11}
  end

  def score
    score = 0
    @hand.each do |card|
      if card.point == 11 && score > 10
        card.point = 1
        score += card.point
      else 
        score += card.point
      end
      if score > 21 && self.any_eleven?
        @hand.detect {|card| card.point == 11}.point = 1
        score -= 10
      end
    end
    score
  end

  def show_cards
    @hand.each do |card|
      print card.value
      puts card.suit
    end 
  end
end
