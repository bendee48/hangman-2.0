class WordToGuess
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def display_word
    '_ _ _ _ _'
  end
end