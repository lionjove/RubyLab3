# frozen_string_literal: true

require 'json'
require_relative 'save'

# Class for loading saves
class SaveLoader
  attr_accessor :saves

  def initialize(directory_path)
    @saves = []
    Dir.foreach(directory_path) do |file_name|
      if (File.extname(file_name) == '.save')
        parse_json(directory_path + '/' + file_name)
      end
    end
  end

  private

  def parse_json(file_path)
    file = File.read(file_path)
    save_node = JSON.parse(file)['stats']
    create_saves(save_node, file_path)
  end

  def create_saves(save_node, file_path)
    file_name = File.basename(file_path, ".*")
    @saves << Save.new(file_name, save_node['health'], 
                                 save_node['mana'], 
                                 save_node['cheerfulness'], 
                                 save_node['fatigue'], 
                                 save_node['money'])
  end
end
