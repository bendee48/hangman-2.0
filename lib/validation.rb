module Validation
  def self.player(answer)
    answer.size > 2 && answer.size < 13
  end
end

# something like this to hold error messages as well

class Validation
  attr_reader :errors

  def initialize
    @errors = []
  end

  def player(answer)
    if answer.size > 2 && answer.size < 13
      true
    else
      errors << "Invalid name"
      false
    end
  end

end
