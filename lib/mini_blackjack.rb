require_relative 'card_and_deck'
require_relative 'player_hand'

class Blackjack
  attr_accessor :player, :dealer

  def initialize(player,dealer,deck)
    @deck = deck
    @player = player
    @dealer = dealer
    if @player.score == 21
      blackjack
    end
  end

  def hit
    @player.hand << @deck.draw!
    @player.hand[-1].card
  end

  def dealer_turn
    puts "dealer's cards: "
    @dealer.show_cards
    puts "dealer's score: " + @dealer.score.to_s
    until @dealer.score >= 17
      @dealer.hand << @deck.draw!
      puts "dealer drew and here are his cards: "
      @dealer.show_cards
      puts "dealer's score: " + @dealer.score.to_s
    end
    result
  end

  def bust
    puts "You went over 21.. you lose."
    exit
  end

  def win
    puts "You beat the dealer! Congratulations!"
    exit
  end

  def lose
    puts "Dealer beat you.. you lose.."
    exit
  end

  def tie
    puts "tied!"
    exit
  end

  def blackjack
    puts "Blackjack! You win!"
    exit
  end

  def result
    if @player.score > 21
      bust
    elsif @dealer.score > 21 or @player.score > @dealer.score
      win
    elsif @dealer.score > @player.score
      lose
    elsif @dealer.score == @player.score
      tie
    end
  end
end

deck = Deck.new
card_1 = deck.draw!
card_2 = deck.draw!
card_3 = deck.draw!
card_4 = deck.draw!
player = PlayerHand.new([card_1,card_3])
dealer = PlayerHand.new([card_2,card_4])
game_over = false
game = Blackjack.new(player,dealer,deck)

puts "Welcome to Blackjack!"

puts "Player was dealt " + player.hand[0].card + " and " + player.hand[1].card
puts "Player score: " + player.score.to_s

puts "Dealer was dealt: " + dealer.hand[0].card + " and one card face down for now."

until game_over
  print "Hit or Stand (type h or s): "
  choice = gets.chomp
  puts
  if choice == "h"
    print "Player was dealt: "
    puts game.hit
    puts "Player score: " + game.player.score.to_s
    game.bust if game.player.score > 21
  elsif choice == "s"
    game.dealer_turn
    game_over = true
  else
    puts "wrong output, retry game"
    exit
  end
end




