class Validation
  attr_reader :errors

  def initialize
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
    if answer =~ /[a-z]/
      true
    else
      errors << 'Answer must be a letter.'
      false
    end
  end
end
