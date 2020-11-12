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

  def create_new_stats(stats)
    res_stats = ValeraStats.new
    fill_stats_struct(res_stats, stats)
    res_stats
  end

  private

  def fill_stats_struct(res_stats, stats)
    res_stats.health = eval_stat_expr(stats.health, @health_expr, stats)
    res_stats.mana = eval_stat_expr(stats.mana, @mana_expr, stats)
    res_stats.cheerfulness = eval_stat_expr(stats.cheerfulness, @cheerfulness_expr, stats)
    res_stats.fatigue = eval_stat_expr(stats.fatigue, @fatigue_expr, stats)
    res_stats.money = eval_stat_expr(stats.money, @money_expr, stats)
  end

  def eval_stat_expr(stat, expr, _stats)
    stat + eval(expr) # rubocop:disable Security/Eval
  end
end
