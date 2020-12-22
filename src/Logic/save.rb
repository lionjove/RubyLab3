# frozen_string_literal: true

require_relative 'valera'
require_relative 'valera_stats'

# Game action, performed by Valera
class Save
    attr_accessor :name, :stats

    def initialize(name, health, mana, cheerfulness, fatigue, money)
      @stats = ValeraStats.new
      @name = name
      @stats.health = health
      @stats.mana = mana
      @stats.cheerfulness = cheerfulness
      @stats.fatigue = fatigue
      @stats.money = money
    end
end