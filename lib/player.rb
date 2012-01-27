class Player

  attr_reader :collected_marble_count, :current_game, :hippo, :releaseable_marble_count, :age

  def initialize(age)
    @age = age
  end

  def empty_marble_collecting_area!
    @collected_marble_count = 0
  end

  def join_game(game)
    empty_marble_collecting_area!
    load_marble_release_area!

    @current_game = game
    game.players << self
  end

  def choose_hippo(hippo)
    @hippo = @current_game.claim_hippo(hippo, self)
  end

  def load_marble_release_area!
    @releaseable_marble_count = 5
  end

end
