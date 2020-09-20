require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'
require_relative 'gallows'
require_relative 'guess_logic'
require_relative 'guess'
require_relative 'validation'
require_relative 'display'

class Game
  attr_accessor :player, :word_to_guess, :guess_logic

  def initialize
    @player = nil
    @word_to_guess = word
    @guess_logic = GuessLogic.new(word_to_guess)
  end

  def start
    player_setup
    main_game_loop
  end

  def main_game_loop
    loop do
      #display gallows
      #puts Gallows::start
      #testing
      puts word_to_guess.word
      Display.word_to_guess(guess_logic)
      guess
      victory if guess_logic.guessed_word == word_to_guess.word
      defeat if game_over?
    end
  end

  def player_setup
    Display.welcome_message
    loop do
      Display.enter_name
      answer = STDIN.gets.chomp
      validate = Validation.new(word_to_guess)
      unless validate.valid_name?(answer)
        Display.validation_errors(validate)
        redo
      end
      self.player = Player.new(answer)
      Display.thank_player(player)
      break
    end
  end

  def guess
    loop do
      Display.beginning_of_guess_round  
      answer = STDIN.gets.chomp.downcase
      validate = Validation.new(word_to_guess)
      unless validate.valid_guess?(answer)
        puts validate.errors.join unless validate.errors.empty?
        redo
      end
      guess = Guess.new(answer)

      #check full word
      if guess_logic.full_word_guess?(guess)
        if guess_logic.correct_word?(guess)
          victory
        else
          defeat
        end
      end
      
      #process guess
      guess_logic.compare(guess)
      
      # display result
      Display.end_of_guess_round(guess_logic)
      break
    end
  end

  private

  def word
    dictionary = Dictionary.new('words.txt')
    WordToGuess.new(dictionary.word)
  end

  def game_over?
    guess_logic.incorrect_guesses > 5
  end

  def win?
    guess_logic.correct_word?(guess)
  end

  def victory
    puts "You win."
    exit
  end

  def defeat
    puts "Game Over"
    exit
  end
end