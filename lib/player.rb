class Player

  attr_reader :collected_marble_count, :current_game, :hippo, :releaseable_marble_count

  def empty_marble_collecting_area!
    @collected_marble_count = 0
  end

  def join_game(game)
    @current_game = game
  end

  def choose_hippo(hippo)
    @hippo = hippo
  end

  def add_marbles_to_release_area(num_marbles)
    @releaseable_marble_count ||= 0
    @releaseable_marble_count += num_marbles
  end

end
