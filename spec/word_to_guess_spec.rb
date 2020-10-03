# frozen_string_literal: true

require_relative '../lib/word_to_guess'
require_relative '../lib/dictionary'

RSpec.describe WordToGuess do
  subject(:word_to_guess) { described_class.new(dictionary.word) }

  let(:dictionary) { instance_double(Dictionary, word: 'hello') }

  describe '#word' do
    it 'returns the word to be guessed' do
      expect(word_to_guess.word).to eql 'hello'
    end
  end
end
