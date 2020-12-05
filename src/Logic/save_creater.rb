# frozen_string_literal: true
require_relative 'action'
require_relative 'valera'
require 'json'

class SaveCreater
  def initialize(stats, directory_path)
    time = Time.new
    date = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s + '_' + time.hour.to_s + '-' + time.min.to_s
    file_path = directory_path + '/' + date + '.rb'
    file = File.open(file_path, "w")
    file.print(generate_json(stats))
  end

  def generate_json(stats)
    save = {'health' => stats.health,
        'mana' => stats.mana,
        'cheerfulness' => stats.cheerfulness,
        'fatigue' => stats.fatigue,
        'money' => stats.money}
    save.to_json
  end
end