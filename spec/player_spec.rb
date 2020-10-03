# frozen_string_literal: true

require_relative '../lib/player'

RSpec.describe Player do
  subject(:player) { described_class.new('jess') }

  it 'has a capitalized name' do
    expect(player.name).to eql 'Jess'
  end
end
