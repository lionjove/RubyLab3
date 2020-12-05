# frozen_string_literal: true

# Class for loading saves
class SaveLoader
  attr_accessor :saves

  def initialize(directory_path)
    @saves = []
    parse_saves(directory_path)
  end
end
