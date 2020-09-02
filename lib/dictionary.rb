class Dictionary
  attr_reader :file
  
  def initialize(file)
    @file = File.open("static/#{file}")
  end

  def word
    words.sample
  end

  private

  def words
    @words ||= file.readlines(chomp: true)
                   .reject do |word|
                      word.size < 5 || word.size > 12
                    end
  end
end