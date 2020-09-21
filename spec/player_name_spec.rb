require_relative '../lib/player_name'

RSpec.describe PlayerName do
  subject(:player_name) { described_class.new('beth') }

  context '#initialize' do
    describe '#name' do
      it 'sets the given name' do
        expect(player_name.name).to eql 'beth'
      end
    end

    describe '#errors' do
      it 'sets an empty array' do
        expect(player_name.errors).to eql []
      end
    end

    describe '#valid?' do
      it 'calls the valid? method' do
        expect_any_instance_of(described_class).to receive(:valid?)
        player_name
      end
    end
  end

  describe 'valid_size?' do
    context 'player name is valid size' do
      it 'returns true if name is between 3 and 12 chars' do
        expect(player_name.valid_size?).to eql true
      end
    end

    context 'player name is invalid size' do
      it 'returns false for a too short name' do
        player_name = described_class.new('po')
        expect(player_name.valid_size?).to eql false
      end

      it 'returns false for a too long name' do
        player_name = described_class.new('montgomery the third esquire')
        expect(player_name.valid_size?).to eql false
      end

    end
  end

  describe '#valid?' do
    context 'player name is invalid' do
      subject(:player_name) { described_class.new('po') }

      it 'returns false' do
        expect(player_name.valid?).to eql false
      end

      it 'adds an error message to errors' do
        expect(player_name.errors).to_not be_empty
      end
    end

    context 'player name is valid' do
      it 'returns true' do
        expect(player_name.valid?).to eql true
      end

      it 'does not add an error message to errors' do
        expect(player_name.errors).to be_empty
      end
    end
  end
end