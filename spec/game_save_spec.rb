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
      allow(YAML).to receive(:dump).and_return(game_data)
      allow(File).to receive(:join).and_return('a file')
      allow(File).to receive(:directory?).and_return(true)
      allow(File).to receive(:open).and_yield(file)
      game_save.save('game')
      expect(file.string).to eql game_data
    end
  end

  describe '.load' do
    it 'loads saved game' do
      file = StringIO.new
      file.puts 'game data'
      file.rewind
      allow(File).to receive(:join).and_return('a file')
      allow(File).to receive(:exist?).and_return(true)
      allow(File).to receive(:open).and_yield(file)
      expect(game_save.load).to eql 'game data'
    end
  end
end
