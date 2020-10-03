require_relative 'player'
require_relative 'dictionary'
require_relative 'word_to_guess'
require_relative 'gallows'
require_relative 'guess_logic'
require_relative 'guess'
require_relative 'display'
require_relative 'player_name'
require_relative 'game_save'
require_relative 'answer'
require 'yaml'

class Game
  attr_accessor :player, :word_to_guess, :guess_logic

  def initialize
    @player = nil
    @word_to_guess = word
    @guess_logic = GuessLogic.new(word_to_guess)
  end

  def start
    welcome
    load_game
    instructions
    player_setup
    main_game_loop
  end

  def main_game_loop
    loop do
      Gallows::GALLOWS[guess_logic.incorrect_guesses]
      #puts word_to_guess.word #TESTING REMOVE
      guess
      victory if win?
      defeat if game_over?
      GameSave.save(self)
    end
  end

  # def test
  #   puts 'hallo'
  #   #guess = Guess.new('bob', WordToGuess.new('bob'))
  #   word_to_guess
  #   #full_word_check(guess)
  #   exit
  #   puts "and in the end"
  # end

  def player_setup
    loop do
      Display.enter_name
      player_name = PlayerName.new($stdin.gets)
      Display.validation_errors(player_name.errors)
      redo unless player_name.valid?
      self.player = Player.new(player_name.answer)
      Display.thank_player(player)
      break
    end
  end

  def guess
    loop do
      Display.beginning_of_guess_round(guess_logic)
      guess = Guess.new($stdin.gets, word_to_guess)
      Display.validation_errors(guess.errors)
      redo unless guess.valid?
      full_word_check(guess) if guess_logic.full_word_guess?(guess)
      guess_logic.compare(guess)
      Display.end_of_guess_round(guess_logic)
      break
    end
  end

  private

  def welcome
    Display.welcome_message
  end

  def instructions
    Display.instruction_intro
    response = Answer.new($stdin.gets)
    Display.instructions if response.answer == 'i'
  end

  def load_game
    Display.load_game
    response = Answer.new($stdin.gets)
    GameSave.load.main_game_loop if response.answer == 'load'
  end

  def full_word_check(guess)
    if guess_logic.correct_word?(guess)
      victory
    else
      defeat
    end
  end

  def word
    dictionary = Dictionary.new('words.txt')
    WordToGuess.new(dictionary.word)
  end

  def game_over?
    guess_logic.incorrect_guesses > 5
  end

  def win?
    guess_logic.guessed_word == word_to_guess.word
  end

  def victory
    Display.victory(word_to_guess)
    reload
  end

  def defeat
    Display.defeat(word_to_guess)
    reload
  end

  def reload
    Display.play_again
    answer = $stdin.gets.chomp.downcase
    if answer == 'yes'
      Game.new.main_game_loop
    else
      Display.leave
      exit
    end
  end
end