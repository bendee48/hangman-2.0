class Guess
  attr_reader :word_to_guess
  attr_accessor :current_guess, :errors
  
  def initialize(current_guess, word_to_guess)
    @current_guess = current_guess.chomp.downcase.strip
    @word_to_guess = word_to_guess.word
    @errors = []
    valid?
  end

  def valid?
    self.errors = []
    errors << 'Must be a letter' unless is_letter?
    errors << 'Must be a single letter or guessing the full word' unless (single_letter? || full_word_guess?)
    errors.empty?
  end

  private

  def is_letter?
    current_guess.match?(/[a-z]/)
  end

  def single_letter?
    current_guess.size == 1
  end

  def full_word_guess?
    current_guess.size == word_to_guess.size
  end
end