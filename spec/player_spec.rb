require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Ryan', deck)

      expect(player).to be_an_instance_of(Player)
    end

    it 'has attributes' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Ryan', deck)

      expect(player.name).to eq('Ryan')
      expect(player.deck).to eq(deck)
    end
  end
  describe '#has_lost' do
    it 'returns if the player has lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Ryan', deck)

      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
      expect(player.deck.cards).to eq([])
    end
  end
end
