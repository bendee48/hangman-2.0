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
    #word_to_guess.gsub(/[^#{guessed_letters}]/, '-')
    word_to_guess.chars.map { |char| guessed_letters.include?(char) ? char : '-' }.join
  end

  def compare(guess)
    if correct_guess?(guess)
      add_letters(guessed_letters, guess)
      messages << "Correct guess"
    else
      add_letters(incorrect_letters, guess)
      self.incorrect_guesses += 1
      messages << "Incorrect guess"
    end
  end

  def full_word_guess?(guess)
    word_to_guess.length == guess.current_guess.length
  end

  def correct_word?(guess)
    word_to_guess == guess.current_guess
  end

  private

  def correct_guess?(guess)
    word_to_guess.include?(guess.current_guess)
  end

  def add_letters(collection, guess)
    collection << guess.current_guess
  end
end