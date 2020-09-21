require_relative '../lib/player_name'

RSpec.describe PlayerName do
  subject { described_class.new('beth') }

  context '#initialize' do
    describe '#name' do
      it 'sets the given name' do
        expect(subject.name).to eql 'beth'
      end
    end

    describe '#errors' do
      it 'sets an empty array' do
        expect(subject.errors).to eql []
      end
    end

    describe '#valid?' do
      it 'calls the valid? method' do
        expect_any_instance_of(described_class).to receive(:valid?)
        subject
      end
    end
  end

  describe 'valid_size?' do
    context 'player name is valid size' do
      it 'returns true if name is between 3 and 12 chars' do
        expect(subject.valid_size?).to eql true
      end
    end

    context 'player name is invalid size' do
      it 'returns false for a too short name' do
        subject = described_class.new('po')
        expect(subject.valid_size?).to eql false
      end

      it 'returns false for a too long name' do
        subject = described_class.new('montgomery the third esquire')
        expect(subject.valid_size?).to eql false
      end

    end
  end

  describe '#valid?' do
    context 'player name is invalid' do
      subject { described_class.new('po') }

      it 'returns false' do
        expect(subject.valid?).to eql false
      end

      it 'adds an error message to errors' do
        expect(subject.errors).to_not be_empty
      end
    end

    context 'player name is valid' do
      it 'returns true' do
        expect(subject.valid?).to eql true
      end

      it 'does not add an error message to errors' do
        expect(subject.errors).to be_empty
      end
    end
  end
end