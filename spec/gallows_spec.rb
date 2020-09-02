require_relative '../lib/gallows'

RSpec.describe Gallows do
  describe '#start' do
    it 'returns the starting gallows' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |
                    |
                    |
                    |\\
                  ============
                GALLOWS

      expect(subject.start).to eq gallows
    end
  end

  describe '#head' do
    it 'returns the gallows with head' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |     O
                    |
                    |
                    |\\
                  ============
                GALLOWS

      expect(subject.head).to eq gallows
    end
  end

  describe '#body' do
    it 'returns the gallows with body' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |     O
                    |     |
                    |
                    |\\
                  ============
                GALLOWS

      expect(subject.body).to eq gallows
    end
  end

  describe '#right_arm' do
    it 'returns the gallows with right arm' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |     O
                    |    /|
                    |
                    |\\
                  ============
                GALLOWS

      expect(subject.right_arm).to eq gallows
    end
  end

  describe '#left_arm' do
    it 'returns the gallows with left arm' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |     O
                    |    /|\
                    |
                    |\\
                  ============
                GALLOWS

      expect(subject.left_arm).to eq gallows
    end
  end

  describe '#right_leg' do
    it 'returns the gallows with right leg' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |     O
                    |    /|\
                    |    /
                    |\\
                  ============
                GALLOWS

      expect(subject.right_leg).to eq gallows
    end
  end

  describe '#left_leg' do
    it 'returns the gallows with left leg' do
      gallows = <<~GALLOWS
                  ===========
                    |/    |
                    |     O
                    |    /|\
                    |    / \
                    |\\
                  ============
                GALLOWS

      expect(subject.left_leg).to eq gallows
    end
  end
end