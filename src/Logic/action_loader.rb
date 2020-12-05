# frozen_string_literal: true

require 'json'
require_relative 'action'

# Class for loading and creating actions
class ActionLoader
  attr_accessor :actions

  def initialize(file_path)
    @actions = []
    parse_json(file_path)
  end

  private

  def parse_json(file_path)
    file = File.read(file_path)
    JSON.parse(file)['Actions'].each do |action_node|
      create_action(action_node)
    end
  end

  def create_action(action_node)
    stat_expressions = action_node['statExpressions']
    @actions << Action.new(stat_expressions['health'],
                           stat_expressions['mana'],
                           stat_expressions['cheerfulness'],
                           stat_expressions['fatigue'],
                           stat_expressions['money'])
    @actions[-1].name = action_node['name']
    @actions[-1].availability_expression = action_node['expression']
  end
end
