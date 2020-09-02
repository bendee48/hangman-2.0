class Dictionary
  attr_reader :file
  
  def initialize(file)
    @file = File.open("spec/#{file}")
  end

  def self.word
    "hello"
  end
end