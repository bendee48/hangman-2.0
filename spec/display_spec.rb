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
      expect { display.word_to_guess(guess_logic) }.to output(" Word to guess: -e---\n\n").to_stdout
    end
  end

  describe '.beginning_of_guess_round' do
    it 'displays beginning of round info' do
      expect { display.beginning_of_guess_round(guess_logic) }.to output.to_stdout
    end
  end

  describe '.end_of_guess_round' do
    context 'correct guess' do
      it 'displays end of game round information' do
        expect { display.end_of_guess_round(guess_logic) }.
                to output("Correct guess!\n").to_stdout 
      end
    end
  end

  describe '.gallows' do
    it 'returns just the gallows for 0 incorrect guesses' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(0)
    start = <<-START
    ===========
      |/    |
      |
      |
      |
      |\\
    ============
    START
      expect { display.gallows(guess_logic) }.to output(start).to_stdout
    end

    it 'returns the gallows and head for 1 incorrect guess' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(1)
    head = <<-HEAD
    ===========
      |/    |
      |     O
      |
      |
      |\\
    ============
    HEAD
      expect { display.gallows(guess_logic) }.to output(head).to_stdout
    end

    it 'returns the gallows, head and body for 2 incorrect guesses' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(2)
    body = <<-BODY
    ===========
      |/    |
      |     O
      |     |
      |
      |\\
    ============
    BODY
      expect { display.gallows(guess_logic) }.to output(body).to_stdout
    end

    it 'returns the gallows with head, right arm and body for 3 incorrect guesses' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(3)
    right_arm = <<-RIGHT_ARM
    ===========
      |/    |
      |     O
      |    /|
      |
      |\\
    ============
    RIGHT_ARM
      expect { display.gallows(guess_logic) }.to output(right_arm).to_stdout
    end

    it 'returns the gallows with head, right arm, left arm and body for 4 incorrect guesses' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(4)
    left_arm = <<-LEFT_ARM
    ===========
      |/    |
      |     O
      |    /|\\
      |
      |\\
    ============
    LEFT_ARM
      expect { display.gallows(guess_logic) }.to output(left_arm).to_stdout
    end

    it 'returns the gallows with head, right arm, left arm, right leg and body for 5 incorrect guesses' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(5)
    right_leg = <<-RIGHT_LEG
    ===========
      |/    |
      |     O
      |    /|\\
      |    /
      |\\
    ============
    RIGHT_LEG
      expect { display.gallows(guess_logic) }.to output(right_leg).to_stdout
    end

    it 'returns the gallows and whole body for 6 or more incorrect guesses' do
      allow(guess_logic).to receive(:incorrect_guesses).and_return(6)
    finish = <<-FINISH
    ===========
      |/    |
      |     O
      |    /|\\
      |    / \\
      |\\
    ============
    FINISH
      expect { display.gallows(guess_logic) }.to output(finish).to_stdout
    end
  end

  # check methods are called maybe
  describe '.beginning_of_guess_round' do
    it 'displays beginning of guess round info' do
      expect { display.beginning_of_guess_round(guess_logic) }.to output.to_stdout
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

  describe '.victory' do
    it 'displays victory text' do
      expect { display.victory }.to output.to_stdout
    end
  end

  describe '.defeat' do
    it 'displays defeat text' do
      expect { display.defeat }.to output.to_stdout
    end
  end

  describe '.load' do
    it 'displays load game text' do
      expect { display.load_game }.to output.to_stdout
    end
  end
end