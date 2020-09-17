require_relative '../lib/display'
require_relative '../lib/guess_logic'

RSpec.describe Display do
  let(:guess_logic) { instance_double(GuessLogic, guessed_word: '-e---', 
                                                  guessed_letters: ['e'],
                                                  incorrect_letters: ['w', 'y', 'z'],
                                                  incorrect_guesses: 2,
                                                  messages: ['Correct guess!']
                                      
  )}
  subject { described_class.new(guess_logic) }

  describe '#end_of_guess_round' do
    it 'displays end of game round information' do
      expect { subject.end_of_guess_round }.
               to output("Correct guess!\n-e---\nWrong letters: w, y, z\nIncorrect guesses: 2\n").to_stdout 
    end
  end

  describe '#beginning_of_guess_round' do
    it 'displays beginning information' do
      expect { subject.beginning_of_guess_round }.to output("Make your guess: \n").to_stdout
    end
  end
end