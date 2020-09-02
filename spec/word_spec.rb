require_relative '../lib/word'
require_relative '../lib/dictionary'

RSpec.describe Word do
  let(:dictionary) { instance_double(Dictionary, word: 'hello') }
  subject { described_class.new(dictionary.word) }

  describe '#word_to_guess' do
    it 'returns the word to be guessed' do
      expect(subject.word_to_guess).to eql 'hello'
    end
  end

  describe '#display_word' do
    it 'displays the current word with no correct guesses' do
      expect(subject.display_word).to eql '_ _ _ _ _'
    end
  end

  describe '#display_word' do
    it 'displays the current word with 1 letter guessed correctly' do
      
    end
  end
end