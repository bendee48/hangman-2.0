require_relative '../lib/word_to_guess'
require_relative '../lib/dictionary'

RSpec.describe WordToGuess do
  let(:dictionary) { instance_double(Dictionary, word: 'hello') }
  subject(:word_to_guess) { described_class.new(dictionary.word) }

  describe '#word' do
    it 'returns the word to be guessed' do
      expect(word_to_guess.word).to eql 'hello'
    end
  end
end