class Display
  def self.word_to_guess(guess_logic)
    puts guess_logic.guessed_word
  end

  def self.beginning_of_guess_round
    puts "Make your guess: "
  end

  def self.end_of_guess_round(guess_logic)
    puts <<~MSG
    #{guess_logic.messages.pop}
    #{guess_logic.guessed_word}
    Wrong letters: #{guess_logic.incorrect_letters.join(', ')}
    Incorrect guesses: #{guess_logic.incorrect_guesses}
    MSG
  end
end