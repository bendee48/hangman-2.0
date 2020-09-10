require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'

class Game
  attr_accessor :player, :word_to_guess

  def initialize
    @player = nil
    @word_to_guess = nil
  end

  def start
    puts "Welcome"
    #set up player
    puts "Enter name: "
    answer = STDIN.gets.chomp
    self.player = Player.new(answer)
    puts "Thanks #{player.name}"
    #set word
    dictionary = Dictionary.new('words.txt')
    dictionary_word = WordToGuess.new(dictionary.word)
    self.word_to_guess = dictionary_word.word
    puts word_to_guess
    #loop
      #display gallows
      #display word to guess
      #make guess
      #process guess
      #display results
  end

  def player_setup
  end
end