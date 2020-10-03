# frozen_string_literal: true

# Class to model user input
class Answer
  attr_accessor :errors, :answer

  def initialize(answer)
    @answer = answer.chomp.downcase.strip
    @errors = []
    exit if quit_game?
  end

  def quit_game?
    answer == 'quit game'
  end
end
