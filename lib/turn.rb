class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @round_winner = winner
  end
  
  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war 
    elsif player1.deck.rank_of_card_at(0) == player1.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    case type
    when :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    when :war
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    when :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    pile_cards_work
    # @spoils_of_war = []
  end

  
  def award_spoils
    winner
    case type
    when :basic
      pile_cards_work
      2.times {@round_winner.deck.add_card(@spoils_of_war.shift)}
    when :war
      pile_cards_work
      6.times {@round_winner.deck.add_card(@spoils_of_war.shift)}
    when :mutually_assured_destruction
      pile_cards_work
    end
  end


private

  def pile_cards_work
    case type
    when :basic
      @spoils_of_war << player1.deck.remove_card << player2.deck.remove_card
    when :war 
      @spoils_of_war << player1.deck.remove_card << player1.deck.remove_card << player1.deck.remove_card 
      @spoils_of_war << player2.deck.remove_card << player2.deck.remove_card << player2.deck.remove_card
    when :mutually_assured_destruction
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end
end