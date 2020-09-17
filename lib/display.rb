class Display
  attr_reader :guess_logic

  def initialize(guess_logic)
    @guess_logic = guess_logic
  end

  def beginning_of_guess_round
    puts "Make your guess: "
  end

  def end_of_guess_round
    puts <<~MSG
    #{guess_logic.messages.pop}
    #{guess_logic.guessed_word}
    Wrong letters: #{guess_logic.incorrect_letters.join(', ')}
    Incorrect guesses: #{guess_logic.incorrect_guesses}
    MSG
  end
end