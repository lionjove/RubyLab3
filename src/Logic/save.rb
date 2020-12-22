# frozen_string_literal: true

require_relative 'valera'
require_relative 'valera_stats'

# Game action, performed by Valera
class Save
  attr_accessor :name, :stats

  def initialize(name, stats)
    @stats = ValeraStats.new
    @name = name
    @stats = stats
  end
end
