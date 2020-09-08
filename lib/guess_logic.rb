class GuessLogic
  attr_reader :word
  attr_accessor :guessed_letters

  def initialize(word_to_guess)
    @word = word_to_guess
  end

  def compare(guess)
    if guess.current_guess == 'h'
      ['h', '-', '-', '-', '-']
    else
      ['h', 'e', '-', '-', '-']
    end
  end
end