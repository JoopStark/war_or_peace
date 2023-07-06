require_relative 'card'
require_relative 'deck'

class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards.count == 0
  end
end