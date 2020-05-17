# frozen_string_literal: true

require_relative 'card'

class CardDeck
  def new_deck
    deck = []
    colors = %i[green blue yellow red]
    colors.each do |color|
      deck.push(create_number_cards(color))
      deck.push(create_action_cards(color))
    end
    deck.push(create_wild_cards)
    deck.flatten
  end

  private

  def create_number_cards(color)
    number_cards = []
    10.times do |num|
      card = Card.new(color, num)
      if num.zero?
        number_cards.push(card)
      else
        2.times do
          number_cards.push(card)
        end
      end
    end
    number_cards
  end

  def create_action_cards(color)
    action_card_types = %i[skip draw_two reverse]
    action_cards = []

    action_card_types.each do |type|
      card = Card.new(color, type)
      2.times do
        action_cards.push(card)
      end
    end
    action_cards
  end

  def create_wild_cards
    wild_card_types = %i[wild wild_draw_four]
    wild_cards = []

    wild_card_types.each do |type|
      card = Card.new(:black, type)
      4.times do
        wild_cards.push(card)
      end
    end
    wild_cards
  end
end
