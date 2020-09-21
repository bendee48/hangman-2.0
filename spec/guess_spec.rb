require_relative '../lib/guess'

RSpec.describe Guess do
  describe '#current_guess' do
    it 'should return the current guess' do
      subject.current_guess = 'e'
      expect(subject.current_guess).to eq 'e'
    end
  end

  describe '#valid?' do
    context 'valid guess' do
      it 'should return true a letter' do
        expect(subject.valid?).to eql true
      end

      it 'should return true for a word the same length as the word to guess' do
        
      end
    end

    context 'invalid guess' do
      it 
    end
  end
end