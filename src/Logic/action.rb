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
    valera.health = eval_stat_expr(valera.health, @health_expr, valera).clamp(0, 100)
    valera.mana = eval_stat_expr(valera.mana, @mana_expr, valera).clamp(0, 100)
    valera.cheerfulness = eval_stat_expr(valera.cheerfulness, @cheerfulness_expr, valera).clamp(-10, 10)
    valera.fatigue = eval_stat_expr(valera.fatigue, @fatigue_expr, valera).clamp(0, 100)
    valera.money = eval_stat_expr(valera.money, @money_expr, valera)
  end

  def eval_stat_expr(stat, expr, _valera)
    stat + eval(expr) # rubocop:disable Security/Eval
  end
end
