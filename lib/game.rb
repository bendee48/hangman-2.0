require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'
require_relative 'gallows'
require_relative 'guess_logic'
require_relative 'guess'

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
      puts "Guess a letter please: "
      answer = STDIN.gets.chomp

      #process guess
      guess = Guess.new(answer)
      #set result
      guess_logic.compare(guess)
      # display result
      guess_logic.guessed_word
      puts "No. of incorrect guesses: #{guess_logic.incorrect_guesses}"
      #check for game over
      game_over?
    end
  end

  def player_setup
    puts "Welcome"
    puts "Enter name: "
    answer = STDIN.gets.chomp
    self.player = Player.new(answer)
    puts "Thanks #{player.name}"
  end

  def word
    dictionary = Dictionary.new('words.txt')
    WordToGuess.new(dictionary.word)
  end

  def game_over?
    if guess_logic.incorrect_guesses > 6
      puts "Game Over"
      true
    end
  end
end