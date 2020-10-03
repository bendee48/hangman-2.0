# frozen_string_literal: true

# Module to hold Gallow graphics
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

  GALLOWS = { 0 => start,
              1 => head,
              2 => body,
              3 => right_arm,
              4 => left_arm,
              5 => right_leg,
              6 => finish }
            .freeze
end
