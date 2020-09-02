class Gallows
  def start
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

  def head
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

  def body
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

  def right_arm
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

  def left_arm
    <<~GALLOWS
      ===========
        |/    |
        |     O
        |    /|\
        |
        |\\
      ============
    GALLOWS
  end

  def right_leg
    <<~GALLOWS
      ===========
        |/    |
        |     O
        |    /|\
        |    /
        |\\
      ============
    GALLOWS
  end

  def left_leg
    <<~GALLOWS
      ===========
        |/    |
        |     O
        |    /|\
        |    / \
        |\\
      ============
    GALLOWS
  end
end