require_relative 'answer'

class Guess < Answer
  attr_reader :word_to_guess
  attr_accessor :errors
  
  def initialize(answer, word_to_guess)
    super(answer)
    @word_to_guess = word_to_guess.word
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
    answer.match?(/[a-z]/)
  end

  def single_letter?
    answer.size == 1
  end

  def full_word_guess?
    answer.size == word_to_guess.size
  end
end