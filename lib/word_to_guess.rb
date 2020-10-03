# frozen_string_literal: true

# Class to model the word to guess
class WordToGuess
  attr_reader :word

  def initialize(word)
    @word = word
  end
end
