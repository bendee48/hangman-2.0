require_relative 'answer'

class PlayerName < Answer
  attr_reader :answer

  def initialize(answer)
    super(answer)
    valid?
  end

  def valid?
    self.errors = []
    errors << "Name must be between 3 - 12 chars." unless valid_size?
    errors.empty?
  end

  private

  def valid_size?
    answer.size > 2 && answer.size < 13
  end   
end