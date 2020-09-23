module Gallows
  def self.start
  <<-GALLOWS
    ===========
      |/    |
      |
      |
      |
      |\\
    ============
  GALLOWS
  end

  def self.head
  <<-GALLOWS
    ===========
      |/    |
      |     O
      |
      |
      |\\
    ============
  GALLOWS
  end

  def self.body
  <<-GALLOWS
    ===========
      |/    |
      |     O
      |     |
      |
      |\\
    ============
  GALLOWS
  end

  def self.right_arm
  <<-GALLOWS
    ===========
      |/    |
      |     O
      |    /|
      |
      |\\
    ============
  GALLOWS
  end

  def self.left_arm
  <<-GALLOWS
    ===========
      |/    |
      |     O
      |    /|\\
      |
      |\\
    ============
  GALLOWS
  end

  def self.right_leg
  <<-GALLOWS
    ===========
      |/    |
      |     O
      |    /|\\
      |    /
      |\\
    ============
  GALLOWS
  end

  def self.finish
  <<-GALLOWS
    ===========
      |/    |
      |     O
      |    /|\\
      |    / \\
      |\\
    ============
  GALLOWS
  end

  GALLOWS = { 0 => self.start, 
              1 => self.head,
              2 => self.body,
              3 => self.right_arm,
              4 => self.left_arm,
              5 => self.right_leg,
              6 => self.finish,
  }.freeze  
end