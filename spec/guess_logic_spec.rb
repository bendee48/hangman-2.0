require_relative '../lib/guess_logic'
require_relative '../lib/word_to_guess'
require_relative '../lib/guess'

RSpec.describe GuessLogic do
  let(:word_to_guess) { instance_double(WordToGuess, word: 'hello') }
  subject { described_class.new(word_to_guess) }

  describe '#word_to_guess' do
    it 'returns the word to guess' do
      expect(subject.word_to_guess).to eq 'hello'
    end
  end

  describe '#compare' do
    context 'guess is correct' do
      it 'adds the correctly guessed letters' do
        guess = instance_double(Guess, current_guess: 'h' )
        subject.compare(guess)
        expect(subject.guessed_letters).to eq ['h']
      end

      it 'adds the correctly guessed letter and returns all guessed letters' do
        guess = instance_double(Guess, current_guess: 'e' )
        allow(subject).to receive(:guessed_letters).and_return ['h']
        subject.compare(guess)
        expect(subject.guessed_letters).to eq ['h', 'e']
      end
    end

    context 'guess is incorrect' do
      it 'adds the incorrectly guessed letters' do
        guess = instance_double(Guess, current_guess: 'q' )
        subject.compare(guess)
        expect(subject.incorrect_letters).to eq ['q']
      end

      it 'adds the incorrectly guessed letters and returns all incorrectly guessed' do
        guess = instance_double(Guess, current_guess: 'w' )
        allow(subject).to receive(:incorrect_letters).and_return ['q']
        subject.compare(guess)
        expect(subject.incorrect_letters).to eq ['q', 'w']
      end
    end
  end

  describe '#guessed_word' do
    context 'no guesses' do
      it 'returns the blank word to guess' do
        expect(subject.guessed_word).to eq '-----'
      end
    end

    context '1 guess right' do
      it 'returns the correctly guessed letter filled in' do
        guess = instance_double(Guess, current_guess: 'e' )
        subject.compare(guess)
        expect(subject.guessed_word).to eq '-e---'
      end

      it 'returns all of the same correctly guessed letter filled in' do
        guess = instance_double(Guess, current_guess: 'l' )
        subject.compare(guess)
        expect(subject.guessed_word).to eq '--ll-'
      end
    end

    context '2 correct guesses' do
      it 'returns all the correctly filled in letters' do
        guess1 = instance_double(Guess, current_guess: 'h' )
        guess2 = instance_double(Guess, current_guess: 'o' )
        subject.compare(guess1)
        subject.compare(guess2)
        expect(subject.guessed_word).to eq 'h---o'
      end
    end

    context 'incorrect guess' do
      it "doesn't fill in any incorrect guesses" do
        guess = instance_double(Guess, current_guess: 'x' )
        subject.compare(guess)
        expect(subject.guessed_word).to eq '-----'
      end
    end
  end

  describe '#incorrect_guesses' do
    it 'increases by 1 if guess is incorrect' do
      guess = instance_double(Guess, current_guess: 'w' )
      expect { subject.compare(guess) }.to change { subject.incorrect_guesses }.by 1
    end
  end
end