# frozen_string_literal: true

require_relative 'valera_stats'

# Valera! Take out your gun!
class Valera
  attr_accessor :stats

  def initialize
    @stats = ValeraStats.new
  end

  def update_stats(new_stats)
    @stats = new_stats

    @stats.health.clamp(0, 100)
    @stats.mana.clamp(0, 100)
    @stats.cheerfulness.clamp(-10, 10)
    @stats.fatigue.clamp(0, 100)
  end
end
