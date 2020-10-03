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
        word = game.word_to_guess.word
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word)
        allow(game).to receive(:loop).and_yield
        expect(game).to receive(:victory)
        game.start
      end

      it 'wins by guessing each letter' do
        letters = game.word_to_guess.word.chars.uniq
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', *letters, 'no')
        expect(game).to receive(:victory).and_call_original
        game.start
      end

      # it 'test' do
      #   allow(game).to receive(:exit).and_return('Exited')
      #   expect { game.test }.to output("hello\nand in the end\n").to_stdout
      # end
    end

    context 'lose' do
      it 'loses by guessing an incorrect word' do
        word = game.word_to_guess.word.chars.shuffle.join
        word = word.chars.shuffle.join
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word, 'no')
        expect(game).to receive(:defeat).and_call_original
        game.start
      end

      it 'loses by running out of lives' do
        let = 'a'
        word = game.word_to_guess.word
        while word.include?(let)
          let = let.next
        end
        letters = (1..6).map { let }
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', *letters, 'no')
        expect(game).to receive(:defeat).and_call_original
        game.start
      end
    end
  end
end