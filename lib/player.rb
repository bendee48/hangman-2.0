# frozen_string_literal: true

# Class to model a player
class Player
  attr_reader :name

  def initialize(name = 'anonymous')
    @name = name.capitalize
  end
end
