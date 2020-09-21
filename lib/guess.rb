class Guess
  attr_accessor :current_guess
  
  def initialize(current_guess=nil)
    @current_guess = current_guess
  end

  def valid?
    true
  end

  
end