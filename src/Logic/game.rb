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
      puts("#{counter}. #{action.name} #{action.available(@valera.stats) ? '' : '(not available)'}")
      counter += 1
    end
  end

  def handle_input(inp)
    apply_action(@actions[inp]) if inp.positive? && inp < @actions.length
  end

  def print_valera_stats
    puts 'Here we will print valera hp, money, mana, etc.'
  end

  def game_ended?
    @valera.stats.health <= 0
  end

  private

  def apply_action(action)
    @valera.update_stats(action.create_new_stats(@valera.stats))
  end
end
