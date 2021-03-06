# frozen_string_literal: true

require_relative '../lib/dictionary'

RSpec.describe Dictionary do
  subject(:dictionary) { described_class.new(file) }

  let(:file) { 'test_file.txt' }

  describe '#word' do
    it 'returns a string' do
      expect(dictionary.word).to be_a String
    end

    it 'returns a string only containing letters' do
      word = dictionary.word
      expect(word).to satisfy('only contain letters') do
        word.chars.all? { |letter| letter =~ /[a-z]/i }
      end
    end

    it 'returns a word between 5 and 12 characters' do
      expect(dictionary.word.size).to be >= 5 and be <= 12
    end

    it 'returns a downcase string' do
      word = dictionary.word
      expect(word).to eql word.downcase
    end
  end
end
