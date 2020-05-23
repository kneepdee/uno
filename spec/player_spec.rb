# frozen_string_literal: true

require_relative '../lib/player.rb'
require 'rspec'

describe Player do
  let(:name) { 'Jordan' }
  let(:player) { Player.new(name) }
  let(:card_deck) { CardDeck.new.new_deck }
  let(:discarded_cards) { [] }

  it 'has a name' do
    expect(player.name).to eq(name)
  end

  it 'has cards' do
    expect(player.cards).to eq([])
  end

  describe 'draw_card' do
    it 'adds a card to player cards' do
      player.draw_card(card_deck, discarded_cards)
      expect(player.cards.length).to eq(1)
    end

    it 'removes the card from card deck' do
      player.draw_card(card_deck, discarded_cards)
      expect(card_deck).not_to include(player.cards[0])
    end

    context 'when cards have run out' do
      it 're-shuffles discarded cards and draws' do
        discarded_cards = [Card.new(:blue, 7), Card.new(:green, 2)]
        empty_card_deck = []
        player.draw_card(empty_card_deck, discarded_cards)
        expect(empty_card_deck.length).to eq(1)
      end

      it 'clears discarded cards' do
        discarded_cards = [Card.new(:blue, 7), Card.new(:green, 2)]
        empty_card_deck = []
        player.draw_card(empty_card_deck, discarded_cards)
        expect(discarded_cards.length).to eq(0)
      end
    end
  end

  describe 'can_play?' do
    it 'returns true when player has a card of current color' do
      current_card = Card.new(:blue, 7)
      player.cards = [Card.new(:blue, 4)]
      expect(player.can_play?(current_card)).to eq(true)
    end

    it 'returns true when player has a card of current value' do
      current_card = Card.new(:blue, 7)
      player.cards = [Card.new(:green, 7)]
      expect(player.can_play?(current_card)).to eq(true)
    end

    it 'returns true when player has a wild card' do
      current_card = Card.new(:blue, 7)
      player.cards = [Card.new(:black, :wild_draw_four)]
      expect(player.can_play?(current_card)).to eq(true)
    end
  end
end
