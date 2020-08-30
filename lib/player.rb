class Player
  attr_reader :name
  
  def initialize(name='anonymous')
    @name = name.capitalize
  end
end