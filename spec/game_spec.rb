require_relative '../lib/game'

RSpec.describe Game do
  subject(:game) { Game.new }

  around(:each) do |example|
    example.run 
    rescue SystemExit
  end

  describe 'play through' do
    context 'win' do
      it 'wins by guessing the correct word' do
        skip
        word = game.word_to_guess.word
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word, 'no')
        game.start
      end

      it 'wins by guessing each letter' do
        skip
        letters = game.word_to_guess.word.chars.uniq
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', *letters, 'no')
        game.start
      end

      # it 'test' do
      #   allow(game).to receive(:full_word_check).with(Guess.new('bob', WordToGuess.new('bob')))
      #   allow($stdin).to receive(:gets).and_return('no')
      #   expect(game).to receive(:word_to_guess).exactly(:once)
        
      #   expect(game).to receive(:full_word_check).with(Guess.new('bob', WordToGuess.new('bob')))
      #   expect(game).to receive(:victory)
      #   game.test
      # end
    end

    context 'lose' do
      it 'loses by guessing an incorrect word' do
        skip
        word = game.word_to_guess.word.chars.shuffle.join
        word = word.chars.shuffle.join
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word, 'no')
        game.start
      end

      it 'loses by running out of lives' do
        skip
        let = 'a'
        word = game.word_to_guess.word
        while word.include?(let)
          let = let.next
        end
        letters = (1..6).map { let }
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', *letters, 'no')
      end
    end
  end
end