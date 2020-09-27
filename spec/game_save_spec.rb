require_relative '../lib/game_save'

RSpec.describe GameSave do
  subject(:game_save) { GameSave }

  describe '.save' do
    it 'saves the a game object' do
      game = double('Game Object')
      file = double('File Object')
      game_data = double('Game Data')
      allow(YAML).to receive(:dump).with(game).and_return(game_data)
      allow(File).to receive(:open).with('./lib/save_games/savegame.txt', 'w').and_yield(file)
      allow(file).to receive(:write).with(game_data)
      game_save.save(game)
      expect(file).to have_received(:write).with(game_data)
    end
  end

  describe '.load' do
    it 'loads saved game' do
      file = double('File Object')
      yaml = double('Yaml data')
      game = double('Game Object')
      allow(File).to receive(:open).with('./lib/save_games/savegame.txt', 'r').and_yield(file)
      allow(file).to receive(:read).and_return(yaml)
      allow(YAML).to receive(:load).and_return(game)
      expect(game_save.load).to eql game
    end
  end

end