class Player

  attr_reader :collected_marble_count, :current_game, :hippo

  def empty_marble_collecting_area!
    @collected_marble_count = 0
  end

  def join_game(game)
    @current_game = game
  end

  def choose_hippo(hippo)
    @hippo = hippo
  end

end
