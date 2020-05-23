# frozen_string_literal: true

require_relative '../lib/player.rb'
require 'rspec'

describe Player do
  name = 'Jordan'
  player = Player.new(name)

  it 'has a name' do
    expect(player.name).to eq(name)
  end

  it 'has cards' do
    expect(player.cards).to eq([])
  end
end
