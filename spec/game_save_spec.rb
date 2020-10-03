# frozen_string_literal: true

require_relative '../lib/game_save'
require_relative '../lib/game'

RSpec.describe GameSave do
  subject(:game_save) { described_class }

  let(:game) { instance_double(Game) }

  describe '.save' do
    it 'saves the a game object' do
      file = StringIO.new
      game_data = 'game data'
      allow(YAML).to receive(:dump).with(game).and_return(game_data)
      allow(File).to receive(:open).with('./lib/save_games/savegame.txt', 'w').and_yield(file)
      game_save.save(game)
      expect(file.string).to eq game_data
    end
  end

  describe '.load' do
    it 'loads saved game' do
      file = instance_double(File)
      yaml = class_double(YAML)
      allow(File).to receive(:open).with('./lib/save_games/savegame.txt', 'r').and_yield(file)
      allow(file).to receive(:read).and_return(yaml)
      allow(YAML).to receive(:load).and_return(game)
      expect(game_save.load).to eql game
    end
  end
end
