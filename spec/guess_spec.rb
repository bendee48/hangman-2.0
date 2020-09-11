require_relative '../lib/guess'

RSpec.describe Guess do
  describe '#current_guess' do
    it 'should return the current guess' do
      subject.current_guess = 'e'
      expect(subject.current_guess).to eq 'e'
    end

    it 'can be a word' do
      subject.current_guess = 'hello'
      expect(subject.current_guess).to eq 'hello'
    end
  end
end