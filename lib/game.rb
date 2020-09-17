require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'
require_relative 'gallows'
require_relative 'guess_logic'
require_relative 'guess'
require_relative 'validation'

class Game
  attr_accessor :player, :word_to_guess, :guess_logic

  def initialize
    @player = nil
    @word_to_guess = word
    @guess_logic = GuessLogic.new(word_to_guess)
  end

  def start
    #set up player
    player_setup
    #loop
    loop do
      #display gallows
      #puts Gallows::start
      #display word to guess
      puts word_to_guess.word
      puts "Word to guess: #{guess_logic.guessed_word}"
      #make guess
      guess
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
      puts "Make your guess: "
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
      unless guess_logic.messages.empty?
        message = guess_logic.messages.pop
        puts message
      end
      # display result
      guess_logic.guessed_word
      puts "Correct letters: #{guess_logic.guessed_letters}"
      puts "Incorrect letters: #{guess_logic.incorrect_letters}"
      puts "No. of incorrect guesses: #{guess_logic.incorrect_guesses}"
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

  def victory
    puts "You win."
    exit
  end

  def defeat
    puts "Game Over"
    exit
  end
end