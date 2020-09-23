require_relative 'gallows'

module Display
  def self.welcome_message
    puts "Welcome."
  end

  def self.enter_name
    puts "Enter your name: "
  end

  def self.validation_errors(errors)
    puts errors.join(', ') unless errors.empty?
  end

  def self.thank_player(player)
    puts "Thanks #{player.name}"
  end

  def self.word_to_guess(guess_logic)
    guess_logic.guessed_word
  end

  def self.gallows(guess_logic)
    Gallows::GALLOWS[guess_logic.incorrect_guesses]
  end

  def self.beginning_of_guess_round(guess_logic)
    puts "\n" + gallows(guess_logic)
    puts word_to_guess(guess_logic)
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

  def self.victory
    puts "You win!"
  end

  def self.defeat
    puts Gallows.finish
    puts "You lose!"
  end
end