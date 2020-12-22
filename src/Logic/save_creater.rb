# frozen_string_literal: true

require_relative 'action'
require_relative 'valera'
require 'json'

# Class for creating saves
class SaveCreater
  def initialize(stats, directory_path)
    time = Time.new
    date = "#{time.year}-#{time.month}-#{time.day}_#{time.hour}-#{time.min}"
    file_path = "#{directory_path}/#{date}.save"
    file = File.open(file_path, 'w')
    file.print(generate_json(stats))
  end

  def generate_json(stats)
    save = { 'stats' => { 'health' => stats.health,
                          'mana' => stats.mana,
                          'cheerfulness' => stats.cheerfulness,
                          'fatigue' => stats.fatigue,
                          'money' => stats.money } }
    save.to_json
  end
end
