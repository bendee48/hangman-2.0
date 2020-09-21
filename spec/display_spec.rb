require_relative '../lib/display'
require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'
require_relative '../lib/player'
require_relative '../lib/player_name'
require_relative '../lib/guess'

RSpec.describe Display do
  subject(:display) { described_class }
  let(:guess_logic) { instance_double(GuessLogic, guessed_word: '-e---', 
                                                  guessed_letters: ['e'],
                                                  incorrect_letters: ['w', 'y', 'z'],
                                                  incorrect_guesses: 2,
                                                  messages: ['Correct guess!']
  )}

  describe '.welcome_message' do
    it 'displays welcome message' do
      expect { display.welcome_message }.to output.to_stdout
    end
  end

  describe '.enter_name' do
    it 'displays enter name text' do
      expect { display.enter_name }.to output.to_stdout
    end
  end

  describe '.thank_player' do
    it 'display thank you message' do
      player = instance_double(Player, name: 'Helen')
      expect { display.thank_player(player) }.to output.to_stdout
    end
  end

  describe '.word_to_guess' do
    it 'displays the word to guess' do
      expect { display.word_to_guess(guess_logic) }.to output("-e---\n").to_stdout
    end
  end

  describe '.end_of_guess_round' do
    it 'displays end of game round information' do
      expect { display.end_of_guess_round(guess_logic) }.
               to output("Correct guess!\n-e---\nWrong letters: w, y, z\nIncorrect guesses: 2\n").to_stdout 
    end
  end

  describe '.beginning_of_guess_round' do
    it 'displays beginning of guess round info' do
      expect { display.beginning_of_guess_round }.to output.to_stdout
    end
  end

  describe '.validation_errors' do
    context 'validation error has been triggered' do
      it 'displays validation errors' do
        errors = ['Name must be between 3 and 12 characters.']
        expect { display.validation_errors(errors) }.to output.to_stdout
      end
    end

    context 'validation error has not been triggered' do
      it 'does not display an error message' do
        errors = []
        expect { display.validation_errors(errors)}.to_not output.to_stdout
      end
    end
  end
end