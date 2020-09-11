class GuessLogic
  attr_reader :word_to_guess, :guessed_letters

  def initialize(word_to_guess)
    @word_to_guess = word_to_guess.word
    @guessed_letters = []
  end

  def compare(guess)
    guessed_letters << guess.current_guess
    word_to_guess.gsub(/[^#{guessed_letters}]/, '-')
  end
end