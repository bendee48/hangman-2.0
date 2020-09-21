require_relative '../lib/gallows'

RSpec.describe Gallows do
  subject(:gallows) { described_class }

  describe '#start' do
    it 'returns the starting gallows' do
      start = <<~START
                  ===========
                    |/    |
                    |
                    |
                    |
                    |\\
                  ============
                START

      expect(gallows::start).to eq start
    end
  end

  describe '#head' do
    it 'returns the gallows with head' do
      head = <<~HEAD
                  ===========
                    |/    |
                    |     O
                    |
                    |
                    |\\
                  ============
                HEAD

      expect(gallows::head).to eq head
    end
  end

  describe '#body' do
    it 'returns the gallows with body' do
      body = <<~BODY
                  ===========
                    |/    |
                    |     O
                    |     |
                    |
                    |\\
                  ============
                BODY

      expect(gallows::body).to eq body
    end
  end

  describe '#right_arm' do
    it 'returns the gallows with right arm' do
      right_arm = <<~RIGHT_ARM
                  ===========
                    |/    |
                    |     O
                    |    /|
                    |
                    |\\
                  ============
                RIGHT_ARM

      expect(gallows::right_arm).to eq right_arm
    end
  end

  describe '#left_arm' do
    it 'returns the gallows with left arm' do
      left_arm = <<~LEFT_ARM
                  ===========
                    |/    |
                    |     O
                    |    /|\\
                    |
                    |\\
                  ============
                LEFT_ARM

      expect(gallows::left_arm).to eq left_arm
    end
  end

  describe '#right_leg' do
    it 'returns the gallows with right leg' do
      right_leg = <<~RIGHT_LEG
                  ===========
                    |/    |
                    |     O
                    |    /|\\
                    |    /
                    |\\
                  ============
                RIGHT_LEG

      expect(gallows::right_leg).to eq right_leg
    end
  end

  describe '#left_leg' do
    it 'returns the gallows with left leg' do
      finish = <<~FINISH
                  ===========
                    |/    |
                    |     O
                    |    /|\\
                    |    / \\
                    |\\
                  ============
                FINISH

      expect(gallows::finish).to eq finish
    end
  end
end