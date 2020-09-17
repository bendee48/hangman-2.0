class Validation
  attr_reader :errors, :word_to_guess

  def initialize(word_to_guess)
    @word_to_guess = word_to_guess.word
    @errors = []
  end

  def valid_name?(answer)
    if answer.size > 2 && answer.size < 13
      true
    else
      errors << "Name must be between 3 and 12 characters."
      false
    end
  end

  def valid_guess?(answer)
    if answer =~ /[a-z]/ && (answer.size == 1 || answer.size == word_to_guess.size)
      true
    else
      errors << 'Guess must be a either a single letter or a full word guess.'
      false
    end
  end
end
