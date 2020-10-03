# frozen_string_literal: true

require_relative '../lib/guess'
require_relative '../lib/word_to_guess'

RSpec.describe Guess do
  subject(:guess) { described_class.new('e', word_to_guess) }

  let(:word_to_guess) { instance_double(WordToGuess, word: 'hello') }

  describe '#valid?' do
    context 'with valid guess' do
      it 'is true for a single letter' do
        expect(guess.valid?).to be true
      end

      it 'is true for a word the same length as the word to guess' do
        guess = described_class.new('fudge', word_to_guess)
        expect(guess.valid?).to be true
      end
    end

    context 'with invalid guess' do
      it 'is false for a number' do
        guess.answer = '3'
        expect(guess.valid?).to be false
      end

      it 'is false for an array' do
        guess.answer = '[]'
        expect(guess.valid?).to be false
      end

      it 'is false if more than 1 letter (and not a full word guess)' do
        guess.answer = 'he'
        expect(guess.valid?).to be false
      end

      it 'adds an error message to errors' do
        guess.answer = '888'
        guess.valid?
        expect(guess.errors).to_not be_empty
      end

      it 'is false for a full word guess that is numbers' do
        guess.answer = '99999'
        expect(guess.valid?).to be false
      end
    end
  end
end
