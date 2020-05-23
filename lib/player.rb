# frozen_string_literal: true

class Player
  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def draw_card(card_deck, discarded_cards)
    if card_deck.length.zero?
      card_deck.append(discarded_cards.shuffle).flatten!
      discarded_cards.clear
    end

    @cards << card_deck.slice!(0)
  end

  def can_play?(current_card)
    @cards.any? do |card|
      card.color == current_card.color ||
        card.value == current_card.value ||
        card.color == :black
    end
  end
end
