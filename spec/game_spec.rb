require_relative '../lib/game'

RSpec.describe Game do
  subject(:game) { Game.new }

  describe 'play through' do
    it 'sets up a player' do
      allow(Game).to receive(:gets).and_return('no', 'no', 'Emma', )
      game.start
    end
  end
end