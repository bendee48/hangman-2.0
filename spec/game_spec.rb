# frozen_string_literal: true

require_relative '../lib/game'

RSpec.describe Game do
  subject(:game) { described_class.new }

  around do |example|
    example.run
  rescue SystemExit
  end

  # Suppresses puts output, comment out to reveal output again.
  before do
    allow($stdout).to receive(:write)
  end

  describe 'play through' do
    context 'with victory' do
      it 'by guessing the correct word' do
        word = game.word_to_guess.word
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word, 'no')
        expect(game).to receive(:victory).and_call_original
        game.start
      end

      it 'by guessing each letter' do
        letters = game.word_to_guess.word.chars.uniq
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', *letters, 'no')
        expect(game).to receive(:victory).and_call_original
        game.start
      end
    end

    context 'with defeat' do
      def wrong_letter
        let = 'a'
        word = game.word_to_guess.word
        while word.include?(let)
          let = let.next
        end
        let
      end

      it 'by guessing an incorrect word' do
        word = game.word_to_guess.word.chars.shuffle.join
        word = word.chars.shuffle.join
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word, 'no')
        expect(game).to receive(:defeat).and_call_original
        game.start
      end

      it 'by running out of lives' do
        let = wrong_letter
        letters = (1..6).map { let }
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', *letters, 'no')
        expect(game).to receive(:defeat).and_call_original
        game.start
      end
    end
  end

  describe 'invaldation is triggered' do
    context 'with invalid name' do
      it 're-tries the loop if player name is invalid' do
        allow($stdin).to receive(:gets).and_return('no', 'no', 'be', 'bee', 'quit game')
        expect(Display).to receive(:enter_name).twice
        game.start
      end
    end

    context 'with invalid guess' do
      it 're-tries the loop if guess is invalid' do
        allow($stdin).to receive(:gets).and_return('no', 'no', 'Dan', '4', 'quit game')
        expect(Display).to receive(:beginning_of_guess_round).twice
        game.start
      end
    end
  end

  describe 'load' do
    it 'loads previously saved game when selected' do
      allow($stdin).to receive(:gets).and_return('load', 'quit game')
      expect(GameSave).to receive(:load).and_call_original
      game.start
    end
  end

  describe 'instructions' do
    it 'instructions are shown when selected' do
      allow($stdin).to receive(:gets).and_return('no', 'i', 'quit game')
      expect(Display).to receive(:instructions).and_call_original
      game.start
    end
  end

  describe 'reload' do
    it 'starts a new game at game end' do
      word = game.word_to_guess.word
      allow($stdin).to receive(:gets).and_return('no', 'no', 'Beth', word, 'yes', 'quit game')
      expect(described_class).to receive(:new).and_call_original
      game.start
    end
  end
end
