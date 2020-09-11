require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'
require_relative '../lib/guess'

RSpec.describe GuessLogic do
  let(:word_to_guess) { instance_double(WordToGuess, word: 'hello') }
  subject { described_class.new(word_to_guess) }

  describe '#compare' do
    it 'returns the correct filled in letters' do
      guess = instance_double(Guess, current_guess: 'h' )
      expect(subject.compare(guess)).to eq 'h----'
    end

    it 'returns the newly guessed letter and previously guessed letters' do
      guess = instance_double(Guess, current_guess: 'e' )
      allow(subject).to receive(:guessed_letters).and_return ['h']
      expect(subject.compare(guess)).to eq 'he---'
    end

    it 'fills in multiple of the same letter' do
      guess = instance_double(Guess, current_guess: 'l' )
      allow(subject).to receive(:guessed_letters).and_return ['h', 'e']
      expect(subject.compare(guess)).to eq 'hell-'
    end

    it 'adds guessed letters to #guessed_letters' do
      guess1 = instance_double(Guess, current_guess: 'h' )
      guess2 = instance_double(Guess, current_guess: 'e' )
      subject.compare(guess1)
      subject.compare(guess2)
      expect(subject.guessed_letters).to eq ['h', 'e']
    end
  end
end