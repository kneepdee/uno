# frozen_string_literal: true

require_relative './card_deck'
require_relative './player'
require 'colorize'

class Game
  attr_reader :players, :card_deck, :current_card, :current_player, :discarded_cards

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

# PLAYING THE GAME

my_game = Game.new

sara = Player.new('sara')
gabriel = Player.new('gabriel')

my_game.add_player(gabriel)
my_game.add_player(sara)

my_game.deal_cards
my_game.draw_first_card
my_game.pick_first_player

def announce_current_card(game)
  puts "Current card: #{game.current_card.color} #{game.current_card.value}".green
  puts ''
end

def announce_current_player(game)
  puts "It's #{game.current_player.name}'s turn".green
  puts ''
end

def list_current_player_cards(game)
  game.current_player.cards.each_with_index.map do |card, index|
    puts "#{index} #{card.color} #{card.value}".yellow
  end
  puts ''
end

announce_current_card(my_game)
announce_current_player(my_game)
puts 'They have the following cards:'
list_current_player_cards(my_game)

puts "what should we do, #{my_game.current_player.name}? play a card or draw one?".blue
action = gets.chomp
puts ''

if action == 'play'
  if my_game.current_player.can_play?(my_game.current_card)
    puts 'you actually do happen to have cards you can play'
    puts ' '
    puts 'which of your cards you want to play?'
    puts 'enter the index of the card'
    list_current_player_cards(my_game)

    card_index = gets.chomp.to_i
    if my_game.current_player.can_play_card?(my_game.current_player.cards[card_index], my_game.current_card)
      puts 'you can play that card'
    else
      puts 'you can not play that card'
    end
  else
    puts 'you dont have any cards you can play' 
  end
end

if action == 'draw'
  my_game.current_player.draw_card(my_game.card_deck, my_game.discarded_cards)
  puts "#{my_game.current_player.name} picked up a new card"
  puts ' '
  puts 'they now have: '
  list_current_player_cards(my_game)
  puts ''
end



