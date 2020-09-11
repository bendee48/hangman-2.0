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
    puts "Welcome"
    #set up player
    player_setup
    #loop
    loop do
      #display gallows
      puts Gallows::start
      #display word to guess
      puts word_to_guess.word
      #make guess
      puts "Guess a letter please: "
      answer = STDIN.gets.chomp
      #require 'byebug'; byebug
      #process guess
      #guess_logic = GuessLogic.new(word_to_guess)
      guess = Guess.new(answer)
      #display results
      puts guess_logic.compare(guess)
    end
  end

  def player_setup
    puts "Enter name: "
    answer = STDIN.gets.chomp
    self.player = Player.new(answer)
    puts "Thanks #{player.name}"
  end

  def word
    dictionary = Dictionary.new('words.txt')
    WordToGuess.new(dictionary.word)
  end
end