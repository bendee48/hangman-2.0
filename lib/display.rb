require_relative 'gallows'

module Display
  def self.welcome_message
    puts "Welcome to Hangman.\n\n"
  end

  def self.instruction_intro
    puts "If you'd like instructions enter 'i'."
    puts "Otherwise press any key to continue."
  end

  def self.instructions
    puts <<-MSG
  Reveal the hidden word before your man is hung.

  You may guess a single letter at a time. 
  A correct guess will result in that letter being filled in.
  Incorrect guesses will result in a part of the stick man being drawn.
  You have 6 incorrect guesses to play with to save your man.
  You may also guess the whole word at any time. But be careful; an incorrect guess is game over.

  The game is auto saved after each round. 
  Use the load function at game start to load a previously saved game.
  Enter 'quit game' at any time to end session.

MSG
  end

  def self.enter_name
    puts "Enter your name: "
  end

  def self.play_again
    puts "Would you like to play again? Enter 'yes' or 'no': "
  end

  def self.leave
    puts "Okay, bye."
  end

  def self.validation_errors(errors)
    puts errors.join(', ') unless errors.empty?
  end

  def self.thank_player(player)
    puts "Thanks #{player.name}"
  end

  def self.word_to_guess(guess_logic)
    puts " Word to guess: #{guess_logic.guessed_word}"
  end

  def self.gallows(guess_logic)
    puts Gallows::GALLOWS[guess_logic.incorrect_guesses]
  end

  def self.beginning_of_guess_round(guess_logic)
    puts <<~MSG
      #{gallows(guess_logic)}
      #{word_to_guess(guess_logic)}
      Wrong letters: #{guess_logic.incorrect_letters.join(', ')}
      Incorrect guesses: #{guess_logic.incorrect_guesses}\n\n
      Make your guess:
    MSG
  end

  def self.end_of_guess_round(guess_logic)
    puts "#{guess_logic.messages.pop}"
  end

  def self.victory(word_to_guess)
    puts "\n Yes! The word was #{word_to_guess.word.upcase}."
    puts "\n  You win!\n\n"
  end

  def self.defeat(word_to_guess)
    puts Gallows.finish
    puts "\n Sorry, you lose!"
    puts "\n The word was #{word_to_guess.word.upcase}\n\n"
  end

  def self.load_game
    puts "Enter 'load' to load previously saved game."
    puts "Or press any key to start a new game."
  end
end