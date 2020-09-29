require_relative '../lib/answer'

RSpec.describe Answer do
  describe '#answer' do
    it 'returns the current guess' do
      answer = described_class.new('e')
      expect(answer.answer).to eql 'e'
    end

    it 'downcases any guess' do
      answer = described_class.new('E')
      expect(answer.answer).to eql 'e'
    end

    it 'removes any newlines' do
      answer = described_class.new("e\n")
      expect(answer.answer).to eql 'e'
    end

    it 'removes tabs' do
      answer = described_class.new("e\r")
      expect(answer.answer).to eql 'e'
    end

    it 'removes added white space' do
      answer = described_class.new("e    ")
      expect(answer.answer).to eql 'e'
    end
  end

  describe '#quit_game?' do
    context 'player chooses to quit game' do
      around(:example) do |example|
        example.run 
        rescue SystemExit
      end

      it 'is true' do
        answer = described_class.new('quit game')
        expect(answer.quit_game?).to eql true
      end
    end
  end
end