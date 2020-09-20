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
    loop do
      #display gallows
      #puts Gallows::start
      #testing
      puts word_to_guess.word
      ##display word to guess
      puts "Word to guess: #{guess_logic.guessed_word}"
      #make guess
      guess
      #check for win
      victory if guess_logic.guessed_word == word_to_guess.word
      #check for game over
      defeat if game_over?
    end
  end

  def player_setup
    puts "Welcome"
    loop do
      puts "Enter name: "
      answer = STDIN.gets.chomp
      validate = Validation.new(word_to_guess)
      unless validate.valid_name?(answer)
        puts validate.errors.join unless validate.errors.empty?
        redo
      end
      self.player = Player.new(answer)
      puts "Thanks #{player.name}"
      break
    end
  end

  def guess
    #make guess
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