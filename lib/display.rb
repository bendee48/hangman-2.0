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
    puts " Word to guess: #{guess_logic.guessed_word}"
    puts
  end

  def self.gallows(guess_logic)
    puts Gallows::GALLOWS[guess_logic.incorrect_guesses]
  end

  def self.beginning_of_guess_round(guess_logic)
    puts <<~MSG
    #{gallows(guess_logic)}
    #{word_to_guess(guess_logic)}
    Wrong letters: #{guess_logic.incorrect_letters.join(', ')}
    Incorrect guesses: "#{guess_logic.incorrect_guesses}\n\n
    Make your guess:
    MSG
  end

  def self.end_of_guess_round(guess_logic)
    puts "#{guess_logic.messages.pop}"
  end

  def self.victory
    puts "You win!"
  end

  def self.defeat
    puts Gallows.finish
    puts "You lose!"
  end

  def self.load_game
    puts "Enter 'load' to load previously saved game."
    puts "Or press any key to start a new game."
  end
end