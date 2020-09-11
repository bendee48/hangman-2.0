require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'
require_relative 'gallows'
require_relative 'guess_logic'
require_relative 'guess'

class Game
  attr_accessor :player, :word_to_guess, :guess_logic,
                :number_of_guesses, :guessed_word

  def initialize
    @player = nil
    @word_to_guess = word
    @guess_logic = GuessLogic.new(word_to_guess)
    @number_of_guesses = 0
    @guessed_word = word_to_guess.word.gsub(/\w/, '-')
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
      puts "Word to guess: #{guessed_word}"
      #make guess
      puts "Guess a letter please: "
      answer = STDIN.gets.chomp

      #process guess
      guess = Guess.new(answer)
      self.number_of_guesses += 1
      puts "No. of guesses: #{number_of_guesses}"
      #set result
      self.guessed_word = guess_logic.compare(guess)

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
    if number_of_guesses > 6
      puts "Game Over"
      true
    end
  end
end