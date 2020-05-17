# frozen_string_literal: true

require_relative '../lib/card.rb'
require 'rspec'

describe Card do
  color = 'blue'
  value = 5
  card = Card.new(color, value)

  it 'has a color' do
    expect(card.color).to eq(color)
  end

  it 'has a value' do
    expect(card.value).to eq(value)
  end
end
