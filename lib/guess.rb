class Guess
  attr_accessor :current_guess
  
  def initialize(guess=nil)
    @current_guess = guess
  end
end