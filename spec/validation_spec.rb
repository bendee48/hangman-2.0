require_relative '../lib/validation'
require_relative '../lib/word_to_guess'

RSpec.describe Validation do
  describe '#name' do
    context 'invalid name' do
      it 'returns false for name that is too short' do
        answer = 'Bo'
        expect(subject.valid_name?(answer)).to eql false
      end

      it 'returns false for name that is too long' do
        answer = 'Booooooooooooooooooooooob'
        expect(subject.valid_name?(answer)).to eql false
      end

      it 'adds error messages to errors' do
        answer = 'Michael St Johnson the Third'
        expect { subject.valid_name?(answer) }.to change { subject.errors.size }.by(1)
      end
    end

    context 'valid name' do
      it 'returns true for valid name' do
        answer = 'Emma'
        expect(subject.valid_name?(answer)).to eql true
      end

      it 'does not add error message to errors' do
        answer = 'Robert'
        expect(subject.errors).to be_empty
      end
    end
  end

  describe '#guess' do
    context 'valid guess' do
      it 'is a letter' do
        guess = 'e'
        expect(subject.valid_guess?(guess)).to eql true
      end
    end

    context 'invalid guess' do
      it 'returns false for a non letter' do
        guess = '2'
        expect(subject.valid_guess?(guess)).to eql false
      end

      it 'returns false for more than 1 letter and not guessing full word' do
        guess = 'eh'
        expect(subject.valid_guess?(guess)).to eql false
      end

      it 'adds an error message to errors' do
        guess = '[]'
        expect { subject.valid_guess?(guess) }.to change { subject.errors.size }.by(1)
      end
    end
  end
end