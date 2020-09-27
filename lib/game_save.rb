require 'yaml'

class GameSave
  def self.save(game)
    game_data = YAML.dump(game)
    File.open('./lib/save_games/savegame.txt', 'w') do |f|
      f.write game_data
    end
  end

  def self.load
    save_file = './lib/save_games/savegame.txt'
    game_data = File.open(save_file, 'r') { |f| f.read }
    YAML.load(game_data)
  end
end