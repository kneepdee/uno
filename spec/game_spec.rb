# frozen_string_literal: true

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/card.rb'
require 'rspec'

def setup_game
  # this helper method creates new game instance,
  # adds 2 players to game and deals cards to them.
  game = Game.new
  player1 = Player.new('Jordan')
  player2 = Player.new('Mike')
  game.add_player(player1)
  game.add_player(player2)
  game.deal_cards
  game
end

describe Game do
  let(:game) { Game.new }

  it 'enables adding players to game' do
    player1 = Player.new('Jordan')
    player2 = Player.new('Mike')
    game.add_player(player1)
    game.add_player(player2)
    expect(game.players).to eq([player1, player2])
  end

  it 'has all 108 cards when game initialized' do
    expect(game.card_deck.length).to eq(108)
  end

  describe 'deal_cards' do
    it 'returns nil when game has less than 2 players' do
      game = Game.new
      player1 = Player.new('Jordan')
      game.add_player(player1)

      expect(game.deal_cards).to eq(nil)
    end

    it 'gives players 7 cards' do
      game = Game.new
      player1 = Player.new('Jordan')
      player2 = Player.new('Mike')
      game.add_player(player1)
      game.add_player(player2)
      game.deal_cards

      expect(player1.cards.length).to eq(7)
    end
  end

  describe 'draw_first_card' do
    game = setup_game
    game.draw_first_card

    it 'removes 1 card from card deck' do
      expect(game.card_deck.length).to eq(93)
    end

    it 'sets the current card' do
      expect(game.current_card).to be_instance_of(Card)
    end

    it 'ensures the deck does not include the current card' do
      current_card = game.current_card
      expect(game.card_deck).to_not include(current_card)
    end
  end
  
  describe 'pick_first_player' do
    game = setup_game
    game.pick_first_player

    it 'sets current player randomly from all players' do
      expect(game.players).to include(game.current_player)
    end

    it 'does not modify the players list' do
      expect(game.players.length).to eq(2)
    end
  end
end
