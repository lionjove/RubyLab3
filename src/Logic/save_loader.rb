# frozen_string_literal: true

require 'json'
require_relative 'save'
require_relative 'valera_stats'

# Class for loading saves
class SaveLoader
  attr_accessor :saves

  def initialize(directory_path)
    @saves = []
    Dir.foreach(directory_path) do |file_name|
      parse_json("#{directory_path}/#{file_name}") if File.extname(file_name) == '.save'
    end
  end

  private

  def parse_json(file_path)
    file = File.read(file_path)
    save_node = JSON.parse(file)['stats']
    create_saves(save_node, file_path)
  end

  def create_saves(save_node, file_path)
    file_name = File.basename(file_path, '.*')
    stats = ValeraStats.new
    stats.health = save_node['health']
    stats.mana = save_node['mana']
    stats.cheerfulness = save_node['cheerfulness']
    stats.fatigue = save_node['fatigue']
    stats.money = save_node['money']
    @saves << Save.new(file_name, stats)
  end
end
