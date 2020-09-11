require_relative '../lib/dictionary'

RSpec.describe Dictionary do
  let(:file) { 'test_file.txt' }
  subject { described_class.new(file) }

  it "takes a file" do
    expect(subject.file).to be_a File 
  end

  describe '#word' do
    it 'returns a string' do
      expect(subject.word).to be_a String
    end

    it 'returns a string only containing letters' do
      word = subject.word
      expect(word).to satisfy('only contain letters') do 
        word.chars.all? { |letter| letter =~ /[a-z]/i }
      end
    end

    it 'returns a word between 5 and 12 characters' do
      expect(subject.word.size).to be >=5 and be <= 12
    end

    it 'returns a downcase string' do
      word = subject.word
      expect(word).to eql word.downcase 
    end
  end
end