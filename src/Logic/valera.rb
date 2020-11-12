# frozen_string_literal: true

# Valera! Take out your gun!
class Valera
  attr_accessor :health, :mana, :cheerfulness, :fatigue, :money

  def initialize
    @health = 100
    @mana = 0
    @cheerfulness = 10
    @fatigue = 0
    @money = 0
  end
end
