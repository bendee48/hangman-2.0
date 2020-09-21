require_relative '../lib/guess'
require_relative '../lib/word_to_guess'

RSpec.describe Guess do
  let(:word_to_guess) { instance_double(WordToGuess, word: 'hello') }
  subject(:guess) { described_class.new('e', word_to_guess) }

  describe '#current_guess' do
    it 'should return the current guess' do
      expect(guess.current_guess).to eql 'e'
    end

    it 'should downcase any guess' do
      guess = described_class.new('E', word_to_guess)
      expect(guess.current_guess).to eql 'e'
    end

    it 'should remove any newlines' do
      guess = described_class.new("e\n", word_to_guess)
      expect(guess.current_guess).to eql 'e'
    end

    it 'should remove tabs' do
      guess = described_class.new("e\r", word_to_guess)
      expect(guess.current_guess).to eql 'e'
    end

    it 'should remove added white space' do
      guess = described_class.new("e    ", word_to_guess)
      expect(guess.current_guess).to eql 'e'
    end
  end

  describe '#valid?' do
    context 'valid guess' do
      it 'should return true for a single letter' do
        expect(guess.valid?).to eql true
      end

      it 'should return true for a word the same length as the word to guess' do
        guess = described_class.new('fudge', word_to_guess)
        expect(guess.valid?).to eql true
      end
    end

    context 'invalid guess' do
      it 'should return false for a number' do
        guess.current_guess = '3'
        expect(guess.valid?).to eql false
      end

      it 'should return false for an array' do
        guess.current_guess = '[]'
        expect(guess.valid?).to eql false
      end

      it 'should return false if more than 1 letter and not a full word guess' do
        guess.current_guess = 'he'
        expect(guess.valid?).to eql false
      end

      it 'should add an error message to errors' do
        guess.current_guess = '888'
        guess.valid?
        expect(guess.errors).to_not be_empty
      end

      it 'should return false for a full word guess that is numbers' do
        guess.current_guess = '99999'
        expect(guess.valid?).to eql false
      end
    end
  end
end