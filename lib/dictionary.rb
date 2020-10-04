# frozen_string_literal: true

# Class to model Dictionary
class Dictionary
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def word
    @word ||= words.sample.downcase
  end

  private

  def words
    @words ||= File.open(File.join(File.dirname(__FILE__), "../static/#{filename}")) do |f|
      f.readlines(chomp: true)
       .reject { |word| word.size < 5 || word.size > 12 }
    end
  end
end
