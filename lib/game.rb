# frozen_string_literal: true

require_relative './card_deck'

class Game
  attr_reader :players, :card_deck

  def initialize
    @players = []
    @card_deck = CardDeck.new.new_deck
  end

  def add_player(player)
    @players << player
  end

  def deal_cards
    return if @players.length < 2

    @players.each do |player|
      player.cards = @card_deck.slice!(0, 7)
    end
  end
end
