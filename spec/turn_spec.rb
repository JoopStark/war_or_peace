require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'

describe Turn do
 context "set-up" do
    it "recieve players with cards" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.player1.name).to eq("Megan")
      expect(turn.player2.name).to eq("Aurora")
    end
  end

  context "Type: basic" do
    it "no spoils" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.player1.name).to eq("Megan")
      expect(turn.spoils_of_war.empty?).to be true
    end

    it "has a type" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
    end

    it "has a winner" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.winner.name).to eq("Megan")
    end

    it "can check spoils of war" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)
      turn.pile_cards

      expect(turn.spoils_of_war.count).to eq(2)
      # p turn.spoils_of_war
    end

    it "gives winners the spoils of war" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)
      
      turn.award_spoils
      expect(turn.type).to eq(:basic)
      # expect(turn.winner.name).to eq("Megan")

      expect(turn.player1.deck.cards.count).to eq(5)
      # p turn.player1.deck.cards
      # expect(turn.spoils_of_war.count).to eq(1)
    end
  end

  context "Type: War" do
    it "knows it is a war type" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:war)
    end

    it "knows the winner" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)
      expect(turn.winner.name).to eq("Aurora")
    end

    it "piles cards for war" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)
    
      turn.pile_cards
      expect(turn.spoils_of_war.count).to eq(6)
    end

    it "awards war spoils" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)
      
      turn.award_spoils
      expect(turn.player2.deck.cards.count).to eq(7)
    end
  end

  context "Type: mutally_assured_destruction" do
    it "knows it is a mutually assured destruction type" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, '8', 8)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    

      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it "has no winner" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, '8', 8)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    

      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq("No Winner")
    end

    it "has no spoils" do
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, '8', 8)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      turn.award_spoils

      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards.count).to eq(1)
    end
  end










end