# frozen_string_literal: true

require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'
require_relative '../lib/guess'

RSpec.describe GuessLogic do
  subject(:guess_logic) { described_class.new(word_to_guess) }

  let(:word_to_guess) { instance_double(WordToGuess, word: 'hello') }

  describe '#word_to_guess' do
    it 'returns the word to guess' do
      expect(guess_logic.word_to_guess).to eq 'hello'
    end
  end

  describe '#compare' do
    context 'when guess is correct' do
      it 'adds the correctly guessed letters' do
        guess = instance_double(Guess, answer: 'h')
        guess_logic.compare(guess)
        expect(guess_logic.guessed_letters).to eq ['h']
      end

      it 'adds the correctly guessed letter and returns all guessed letters' do
        guess = instance_double(Guess, answer: 'e')
        allow(guess_logic).to receive(:guessed_letters).and_return ['h']
        guess_logic.compare(guess)
        expect(guess_logic.guessed_letters).to eq %w[h e]
      end

      it 'adds positive message to messages' do
        guess = instance_double(Guess, answer: 'o')
        expect { guess_logic.compare(guess) }.to change { guess_logic.messages.size }.by(1)
      end
    end

    context 'when guess is incorrect' do
      it 'adds the incorrectly guessed letters' do
        guess = instance_double(Guess, answer: 'q')
        guess_logic.compare(guess)
        expect(guess_logic.incorrect_letters).to eq ['q']
      end

      it 'adds the incorrectly guessed letters and returns all incorrectly guessed' do
        guess = instance_double(Guess, answer: 'w')
        allow(guess_logic).to receive(:incorrect_letters).and_return ['q']
        guess_logic.compare(guess)
        expect(guess_logic.incorrect_letters).to eq %w[q w]
      end

      it 'adds a negative message to messages' do
        guess = instance_double(Guess, answer: 'w')
        expect { guess_logic.compare(guess) }.to change { guess_logic.messages.size }.by(1)
      end
    end
  end

  describe '#guessed_word' do
    context 'with no guesses' do
      it 'returns the blank word to guess' do
        expect(guess_logic.guessed_word).to eq '-----'
      end
    end

    context 'with 1 guess right' do
      it 'returns the correctly guessed letter filled in' do
        guess = instance_double(Guess, answer: 'e')
        guess_logic.compare(guess)
        expect(guess_logic.guessed_word).to eq '-e---'
      end

      it 'returns all of the same correctly guessed letter filled in' do
        guess = instance_double(Guess, answer: 'l')
        guess_logic.compare(guess)
        expect(guess_logic.guessed_word).to eq '--ll-'
      end
    end

    context 'with 2 correct guesses' do
      it 'returns all the correctly filled in letters' do
        guess1 = instance_double(Guess, answer: 'h')
        guess2 = instance_double(Guess, answer: 'o')
        guess_logic.compare(guess1)
        guess_logic.compare(guess2)
        expect(guess_logic.guessed_word).to eq 'h---o'
      end
    end

    context 'with incorrect guess' do
      it "doesn't fill in any incorrect guesses" do
        guess = instance_double(Guess, answer: 'x')
        guess_logic.compare(guess)
        expect(guess_logic.guessed_word).to eq '-----'
      end
    end
  end

  describe '#incorrect_guesses' do
    it 'increases by 1 if guess is incorrect' do
      guess = instance_double(Guess, answer: 'w')
      expect { guess_logic.compare(guess) }.to change(guess_logic, :incorrect_guesses).by 1
    end
  end

  describe '#full_word_guess' do
    context 'when guess is same length as word to guess' do
      it 'returns true' do
        guess = instance_double(Guess, answer: 'threw')
        expect(guess_logic.full_word_guess?(guess)).to be true
      end
    end

    context 'when guess is not same length as word to guess' do
      it 'returns false' do
        guess = instance_double(Guess, answer: 'thrw')
        expect(guess_logic.full_word_guess?(guess)).to be false
      end
    end
  end

  describe '#correct_word?' do
    context 'when full word guess is correct' do
      it 'returns true' do
        guess = instance_double(Guess, answer: 'hello')
        expect(guess_logic.correct_word?(guess)).to be true
      end
    end

    context 'when full word guess is incorrect' do
      it 'returns true' do
        guess = instance_double(Guess, answer: 'hippo')
        expect(guess_logic.correct_word?(guess)).to be false
      end
    end
  end
end
