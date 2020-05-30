# frozen_string_literal: true

require_relative './card_deck'
require_relative './player'

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

my_game = Game.new

sara = Player.new('sara')
gabriel = Player.new('gabriel')

my_game.add_player(gabriel)
my_game.add_player(sara)

my_game.deal_cards
my_game.draw_first_card
my_game.pick_first_player

def announce_current_card_and_player(game)
  puts "Current card: #{game.current_card.color} #{game.current_card.value}"
  puts "It's #{game.current_player.name}'s turn"
  puts ' '
end

announce_current_card_and_player(my_game)

puts "you have following cards:"
my_game.current_player.cards.map { |card|  puts "#{card.color} #{card.value}" }
puts ' '

puts "what should we do #{my_game.current_player.name}? play a card or draw one?"
action = gets.chomp

if action == 'play'
  puts 'we wanna play a card'
else
  puts 'we wanna draw a card'
end


