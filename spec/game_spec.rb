# frozen_string_literal: true

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require 'rspec'

describe Game do
  game = Game.new
  
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
end
