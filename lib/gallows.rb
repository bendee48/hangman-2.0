module Gallows
  def self.start
    <<~GALLOWS
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
    <<~GALLOWS
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
    <<~GALLOWS
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
    <<~GALLOWS
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
    <<~GALLOWS
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
    <<~GALLOWS
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
    <<~GALLOWS
      ===========
        |/    |
        |     O
        |    /|\\
        |    / \\
        |\\
      ============
    GALLOWS
  end
end