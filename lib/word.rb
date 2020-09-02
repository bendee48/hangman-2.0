class Word
  attr_reader :word_to_guess

  def initialize(word)
    @word_to_guess = word
  end

  def display_word
    '_ _ _ _ _'
  end
end