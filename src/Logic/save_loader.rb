# frozen_string_literal: true

require 'json'

# Class for loading saves
class SaveLoader
  def initialize(file_path)
    parse_json(file_path)
  end

  private

  def parse_json(file_path)
    file = File.read(file_path)
  end
end
