require_relative '../lib/game'

RSpec.describe Game do
  describe '#start' do
    it 'should start a game' do
      expect { subject.start }.to output(/welcome/i).to_stdout
    end
  end
end