# frozen_string_literal: true

require_relative 'valera'

# Game action, performed by Valera
class Action
  def initialize(health_expr, mana_expr, cheerfulness_expr, fatigue_expr, money_expr)
    @health_expr = health_expr
    @mana_expr = mana_expr
    @cheerfulness_expr = cheerfulness_expr
    @fatigue_expr = fatigue_expr
    @money_expr = money_expr
  end

  def do_action(valera)
    valera.health = eval_stat_expr(valera.health, @health_expr, valera)
    valera.mana = eval_stat_expr(valera.mana, @mana_expr, valera)
    valera.cheerfulness = eval_stat_expr(valera.cheerfulness, @cheerfulness_expr, valera)
    valera.fatigue = eval_stat_expr(valera.fatigue, @fatigue_expr, valera)
    valera.money = eval_stat_expr(valera.money, @money_expr, valera)

    clamp_values(valera)
  end

  private

  def clamp_values(valera)
    valera.health.clamp(0, 100)
    valera.mana.clamp(0, 100)
    valera.cheerfulness.clamp(-10, 10)
    valera.fatigue.clamp(0, 100)
  end

  def eval_stat_expr(stat, expr, _valera)
    stat + eval(expr) # rubocop:disable Security/Eval
  end
end
