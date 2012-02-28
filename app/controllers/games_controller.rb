class GamesController < ApplicationController

  class Player < Struct.new(:html_class, :name, :you)
    def to_partial_path
      'player'
    end
  end

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
    
    @players = [
      Player.new('sweetie', 'Player 1', false),
      Player.new('bottomless', 'Player 2', true),
      Player.new('picky', 'Player 3', false),
      Player.new('veggie', 'Player 4', false)
    ]
  end

end
