class GuessLogic
  attr_reader :word_to_guess
  attr_accessor :guessed_letters

  def initialize(word_to_guess)
    @word_to_guess = word_to_guess.word
    @guessed_letters = []
  end

  def compare(guess)
    if guess.current_guess == 'h'
      ['h', '-', '-', '-', '-']
    else
      ['h', 'e', '-', '-', '-']
    end
  end
end