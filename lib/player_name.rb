class PlayerName
  attr_reader :name
  attr_accessor :errors

  def initialize(name)
    @name = name
    @errors = []
    valid?
  end

  def valid?
    self.errors = []
    errors << "Invalid size" unless valid_size?
    errors.empty?
  end

  def valid_size?
    name.size > 2 && name.size < 13
  end   
end