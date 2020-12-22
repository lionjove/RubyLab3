# frozen_string_literal: true

require_relative 'valera'

# Game action, performed by Valera
class Save
    attr_accessor :name, :health, :mana, :cheerfulness, :fatigue, :money

    def initialize(name, health, mana, cheerfulness, fatigue, money)
      @name = name
      @health = health
      @mana = mana
      @cheerfulness = cheerfulness
      @fatigue = fatigue
      @money = money
    end
end