# frozen_string_literal: true

require_relative './valera'
require_relative './action_loader'

# Main class for game
class Game
  def initialize
    @valera = Valera.new
    action_loader = ActionLoader.new("#{__dir__}/../../data/config.json")
    @actions = action_loader.actions
  end

  def print_actions
    counter = 1
    @actions.each do |action|
      puts("#{counter}. #{action.name}")
      counter += 1
    end
  end

  def handle_input(inp)
    puts inp
  end

  def print_valera_stats
    puts 'Here we will print valera hp, money, mana, etc.'
  end

  def game_ended?
    true
  end
end
