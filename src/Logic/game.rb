# frozen_string_literal: true

require_relative './valera'
require_relative './action_loader'

# Main class for game
class Game
  attr_accessor :valera
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
    action_num = inp.to_i - 1
    puts action_num
    return unless action_num >= 0 && action_num < @actions.length && @actions[action_num].available(@valera.stats)

    apply_action(@actions[action_num])
  end

  def print_valera_stats
    puts 'Valera stats:'
    puts("Health: #{@valera.stats.health}")
    puts("Mana: #{@valera.stats.mana}")
    puts("Cheerfulness: #{@valera.stats.cheerfulness}")
    puts("Fatigue: #{@valera.stats.fatigue}")
    puts("Money: #{@valera.stats.money}")
  end

  def game_ended?
    @valera.stats.health <= 0
  end

  private

  def apply_action(action)
    @valera.update_stats(action.create_new_stats(@valera.stats))
  end
end
