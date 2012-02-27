class GamesController < ApplicationController

  def index

  end

  def show
    state = params[:id].to_sym

    @online = (state != :offline)
    @full = (state == :full)
    @alone = (state == :alone)
    @free_hippo = (state == :free_hippo)
    @playing = (state == :playing)
    @game_over = (state == :game_over)

    #- game is empty
    #  - choose a hippo and start playing
    #  - invite friends

    #- game is partially full
    #  - choose a hippo and start playing

    #- game is full
    #  - wait

    #- hippo frees up
    #  - choose hippo

    #- you are playing
    #  - play

    #- your game has ended
    #  - play again or join waitlist
  end

end
