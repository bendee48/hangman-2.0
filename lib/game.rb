require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'
require_relative 'gallows'

class Game
  attr_accessor :player, :word_to_guess

  def initialize
    @player = nil
    @word_to_guess = nil
  end

  def start
    puts "Welcome"
    #set up player
    player_setup
    #set word
    set_word
    #loop
    loop do
      #display gallows
      puts Gallows::start
      #display word to guess
      #make guess
      #process guess
      #display results
      break
    end
  end

  def player_setup
    puts "Enter name: "
    answer = STDIN.gets.chomp
    self.player = Player.new(answer)
    puts "Thanks #{player.name}"
  end

  def set_word
    dictionary = Dictionary.new('words.txt')
    dictionary_word = WordToGuess.new(dictionary.word)
    self.word_to_guess = dictionary_word.word
    puts word_to_guess
  end
end