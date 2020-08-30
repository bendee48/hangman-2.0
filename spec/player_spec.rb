require_relative '../lib/player'

RSpec.describe Player do
  subject { described_class.new('jess') }

  it 'has a name' do
    expect(subject.name).to eql 'Jess'
  end  
end