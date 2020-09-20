require_relative '../lib/display'
require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'
require_relative '../lib/validation'
require_relative '../lib/player'

RSpec.describe Display do
  subject { described_class }
  let(:guess_logic) { instance_double(GuessLogic, guessed_word: '-e---', 
                                                  guessed_letters: ['e'],
                                                  incorrect_letters: ['w', 'y', 'z'],
                                                  incorrect_guesses: 2,
                                                  messages: ['Correct guess!']
  )}

  describe '.welcome_message' do
    it 'displays welcome message' do
      expect { subject.welcome_message }.to output.to_stdout
    end
  end

  describe '.enter_name' do
    it 'displays enter name text' do
      expect { subject.enter_name }.to output.to_stdout
    end
  end

  describe '.thank_player' do
    it 'display thank you message' do
      player = instance_double(Player, name: 'Helen')
      expect { subject.thank_player(player) }.to output.to_stdout
    end
  end

  describe '.word_to_guess' do
    it 'displays the word to guess' do
      expect { subject.word_to_guess(guess_logic) }.to output("-e---\n").to_stdout
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
      expect { subject.beginning_of_guess_round }.to output.to_stdout
    end
  end

  describe '.validation_errors' do
    context 'validation error has been triggered' do
      it 'displays validation errors' do
        validate = instance_double(Validation, errors: ['Name must be between 3 and 12 characters.'])
        expect { subject.validation_errors(validate) }.to output.to_stdout
      end
    end

    context 'validation error has not been triggered' do
      it 'does not display an error message' do
        validate = instance_double(Validation, errors: [])
        expect { subject.validation_errors(validate)}.to_not output.to_stdout
      end
    end
  end
end