# frozen_string_literal: true

require 'yaml'

# Class to save and load game
class GameSave
  def self.save(game)
    game_data = YAML.dump(game)
    File.open('./lib/save_games/savegame.txt', 'w') do |f|
      f.write game_data
    end
  end

  def self.load
    save_file = './lib/save_games/savegame.txt'
    begin
      game_data = File.open(save_file, 'r', &:read)
      YAML.load(game_data)
    rescue StandardError
      puts 'No current save file'
    end
  end
end
