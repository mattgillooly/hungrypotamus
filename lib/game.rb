class Game

  attr_reader :players, :current_player, :available_hippos, :claimed_hippos, :state

  def initialize
    @players = []

    @available_hippos = [Hippo.new, Hippo.new, Hippo.new, Hippo.new]
    @claimed_hippos = {}
    @state = :setup
  end

  def youngest_player
    players.min_by(&:age)
  end

  def start!
    @current_player = youngest_player
    @state = :active
  end

  def claim_hippo(hippo, player)
    return false if @claimed_hippos[player]

    if @available_hippos.delete(hippo)
      start! if @available_hippos.empty?

      @claimed_hippos[player] = hippo
    end
  end
end
