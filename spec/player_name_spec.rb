# frozen_string_literal: true

require_relative '../lib/player_name'

RSpec.describe PlayerName do
  subject(:player_name) { described_class.new('beth') }

  describe '#initialize' do
    describe '#name' do
      it 'sets the given name' do
        expect(player_name.answer).to eql 'beth'
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

  describe '#valid?' do
    context 'when player name is valid' do
      it 'is true if name is between 3 and 12 chars' do
        expect(player_name.valid?).to be true
      end

      it 'does not add an error message to errors' do
        expect(player_name.errors).to be_empty
      end
    end

    context 'when player name is invalid' do
      subject(:player_name) { described_class.new('po') }

      it 'is false' do
        expect(player_name.valid?).to be false
      end

      it 'is false if name is below 3 chars' do
        player_name = described_class.new('po')
        expect(player_name.valid?).to be false
      end

      it 'is false if name is longer than 12 chars' do
        player_name = described_class.new('montgomery the third esquire')
        expect(player_name.valid?).to be false
      end

      it 'adds an error message to errors' do
        expect(player_name.errors).to_not be_empty
      end
    end
  end
end
