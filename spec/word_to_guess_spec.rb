require_relative '../lib/word_to_guess'
require_relative '../lib/dictionary'

RSpec.describe WordToGuess do
  let(:dictionary) { instance_double(Dictionary, word: 'hello') }
  subject { described_class.new(dictionary.word) }

  describe '#word' do
    it 'returns the word to be guessed' do
      expect(subject.word).to eql 'hello'
    end
  end
end