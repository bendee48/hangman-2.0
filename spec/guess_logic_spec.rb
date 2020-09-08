require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'
require_relative '../lib/guess'

RSpec.describe GuessLogic do
  let(:word_to_guess) { instance_double(WordToGuess, word: 'hello') }
  subject { described_class.new(word_to_guess) }

  describe '#compare' do
    it 'returns the correct letter guessed, filled in' do
      guess = instance_double(Guess, current_guess: 'h' )
      expect(subject.compare(guess)).to eq ['h', '-', '-', '-', '-']
    end

    it 'returns the newly guessed letter and previously guessed letters' do
      guess = instance_double(Guess, current_guess: 'e' )
      expect(subject.compare(guess)).to eq ['h', 'e', '-', '-', '-']
    end
  end
end