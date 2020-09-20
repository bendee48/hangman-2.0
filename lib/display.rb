class Display
  def self.welcome_message
    puts "Welcome."
  end

  def self.enter_name
    puts "Enter your name: "
  end

  def self.validation_errors(validation)
    puts validation.errors.join unless validation.errors.empty?
  end

  def self.word_to_guess(guess_logic)
    puts guess_logic.guessed_word
  end

  def self.thank_player(player)
    puts "Thanks #{player.name}"
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