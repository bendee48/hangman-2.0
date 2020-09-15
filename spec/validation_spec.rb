require_relative '../lib/validation'

RSpec.describe Validation do
  describe '.player' do
    context 'invalid names' do
      it 'returns false for name that is too short' do
        answer = 'Bo'
        expect(subject.player(answer)).to eql false
      end

      it 'returns false for name that is too long' do
        answer = 'Booooooooooooooooooooooob'
        expect(subject.player(answer)).to eql false
      end
    end

    context 'valid name' do
      it 'returns true for valid name' do
        answer = 'Emma'
        expect(subject.player(answer)).to eql true
      end
    end
  end
end