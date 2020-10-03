# frozen_string_literal: true

require_relative 'answer'

# Class to model a player's name given as an answer
class PlayerName < Answer
  attr_reader :answer

  def initialize(answer)
    super(answer)
    valid?
  end

  def valid?
    self.errors = []
    errors << 'Name must be between 3 - 12 chars.' unless valid_size?
    errors.empty?
  end

  private

  def valid_size?
    answer.size > 2 && answer.size < 13
  end
end
