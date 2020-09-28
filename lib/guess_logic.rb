class GuessLogic
  attr_reader :word_to_guess, :guessed_letters
  attr_accessor :incorrect_guesses, :incorrect_letters,
                :messages

  def initialize(word_to_guess)
    @word_to_guess = word_to_guess.word
    @guessed_letters = []
    @incorrect_letters = []
    @incorrect_guesses = 0
    @messages = []
  end

  def guessed_word
    word_to_guess.chars.map { |char| guessed_letters.include?(char) ? char : '-' }.join
  end

  def compare(guess)
    if correct_guess?(guess)
      add_letters(guessed_letters, guess)
      messages << "\n That's Correct!"
    else
      add_letters(incorrect_letters, guess)
      self.incorrect_guesses += 1
      messages << "\n Sorry, that's incorrect."
    end
  end

  def full_word_guess?(guess)
    word_to_guess.length == guess.answer.length
  end

  def correct_word?(guess)
    word_to_guess == guess.answer
  end

  private

  def correct_guess?(guess)
    word_to_guess.include?(guess.answer)
  end

  def add_letters(collection, guess)
    collection << guess.answer
  end
end