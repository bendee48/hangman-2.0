# frozen_string_literal: true

require 'yaml'
require 'fileutils'

# Class to save and load game
class GameSave
  def self.save(game)
    game_data = YAML.dump(game)
    save_file = File.join(File.dirname(__FILE__), '../lib/save_games/savegame.txt')
    dirname = File.dirname(save_file)

    FileUtils.mkdir(dirname) unless File.directory?(dirname)

    File.open(save_file, 'w') do |f|
      f.write game_data
    end
  end

  def self.load
    save_file = File.join(File.dirname(__FILE__), '../lib/save_games/savegame.txt')

    return nil unless File.exist?(save_file)

    game_data = File.open(save_file, 'r', &:read)
    YAML.load(game_data)
  end
end
