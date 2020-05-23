# frozen_string_literal: true

require_relative './card_deck'

class Game
  attr_reader :players, :card_deck, :current_card, :current_player

  def initialize
    @players = []
    @card_deck = CardDeck.new.new_deck
    @current_card = nil
    @current_player = nil
    @discarded_cards = []
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

  def draw_first_card
    @current_card = @card_deck.slice!(0)
  end

  def pick_first_player
    @current_player = @players.sample
  end
end
