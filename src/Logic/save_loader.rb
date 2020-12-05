# frozen_string_literal: true

# Class for loading saves
class SaveLoader
  attr_accessor :saves

  def initialize(file_path)
    @saves = []
    parse_json(file_path)
  end
end
