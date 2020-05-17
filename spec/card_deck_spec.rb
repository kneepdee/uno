# frozen_string_literal: true

require_relative '../lib/card_deck.rb'
require_relative '../lib/card.rb'
require 'rspec'

def deck_has_card?(deck, color, value)
  deck.new_deck.any? do |card|
    card.color == color && card.value == value
  end
end

def count_cards_of_color(deck, color)
  deck.new_deck.count do |card|
    card.color == color
  end
end

def count_cards_of_value(deck, value)
  deck.new_deck.count do |card|
    card.value == value
  end
end

describe CardDeck do
  card_deck = CardDeck.new

  it 'includes 108 cards' do
    expect(card_deck.new_deck.length).to eq(108)
  end

  it 'includes 8 cards with value "9"' do
    expect(count_cards_of_value(card_deck, 9)).to eq(8)
  end

  it 'includes 8 cards with value "reverse"' do
    expect(count_cards_of_value(card_deck, :reverse)).to eq(8)
  end

  it 'includes 4 cards with value "0"' do
    expect(count_cards_of_value(card_deck, 0)).to eq(4)
  end

  it 'includes 4 cards with value "wild"' do
    expect(count_cards_of_value(card_deck, :wild)).to eq(4)
  end

  it 'includes 25 red cards' do
    expect(count_cards_of_color(card_deck, :red)).to eq(25)
  end

  it 'includes 25 blue cards' do
    expect(count_cards_of_color(card_deck, :blue)).to eq(25)
  end

  it 'includes 25 green cards' do
    expect(count_cards_of_color(card_deck, :green)).to eq(25)
  end

  it 'includes 25 yellow cards' do
    expect(count_cards_of_color(card_deck, :yellow)).to eq(25)
  end

  it 'includes 8 black cards' do
    expect(count_cards_of_color(card_deck, :black)).to eq(8)
  end

  it 'has a random color random number card' do
    expect(deck_has_card?(card_deck, :blue, 8)).to eq(true)
  end

  it 'has a random color random action card' do
    expect(deck_has_card?(card_deck, :red, :draw_two)).to eq(true)
  end

  it 'has a random wild card' do
    expect(deck_has_card?(card_deck, :black, :wild_draw_four)).to eq(true)
  end
end
