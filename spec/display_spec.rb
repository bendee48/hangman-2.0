require_relative '../lib/display'
require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'

RSpec.describe Display do
  subject { described_class }
  let(:guess_logic) { instance_double(GuessLogic, guessed_word: '-e---', 
                                                  guessed_letters: ['e'],
                                                  incorrect_letters: ['w', 'y', 'z'],
                                                  incorrect_guesses: 2,
                                                  messages: ['Correct guess!']
  )}

  describe '.word_to_guess' do
    it 'displays the word to guess' do
      expect { Display.word_to_guess(guess_logic) }.to output("-e---\n").to_stdout
    end
  end

  describe '.end_of_guess_round' do
    it 'displays end of game round information' do
      expect { subject.end_of_guess_round(guess_logic) }.
               to output("Correct guess!\n-e---\nWrong letters: w, y, z\nIncorrect guesses: 2\n").to_stdout 
    end
  end

  describe '.beginning_of_guess_round' do
    it 'displays beginning of guess round info' do
      expect { subject.beginning_of_guess_round }.to output("Make your guess: \n").to_stdout
    end
  end
end