class GamesController < ApplicationController

  class LiveVideo
    def to_partial_path
      'live_video'
    end
  end

  class VideoOffline
    def to_partial_path
      'video_offline'
    end
  end

  class Player < Struct.new(:html_class, :name, :available, :you)
    def to_partial_path
      'player'
    end
  end

  class OfflineHippo < Struct.new(:html_class)
    def to_partial_path
      'offline_hippo'
    end
  end

  class AvailableHippo < Struct.new(:html_class)
    def to_partial_path
      'available_hippo'
    end
  end

  def index
    redirect_to game_path('offline')
  end

  def show
    state = params[:id].to_sym

    @online = (state != :offline)
    @full = (state == :full)
    @alone = (state == :alone)
    @free_hippo = (state == :free_hippo)
    @playing = (state == :playing)
    @game_over = (state == :game_over)

    if @online
      @video = LiveVideo.new
    else
      @video = VideoOffline.new
    end

    @current_user_has_hippo = [:full, :playing].include?(state)

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
   
    @players = players_for_state(state) 

    @chat_events = [] #ChatEvent.most_recent
  end

private

  def players_for_state(state)
    case state
    when :offline
      [
        OfflineHippo.new('sweetie'),
        OfflineHippo.new('bottomless'),
        OfflineHippo.new('picky'),
        OfflineHippo.new('veggie')
      ]
    when :full
      [
        Player.new('sweetie', 'Judy'),
        Player.new('bottomless', 'Matt'),
        Player.new('picky', 'Steve'),
        Player.new('veggie', 'Carol')
      ]
    when :alone
      [
        AvailableHippo.new('sweetie'),
        AvailableHippo.new('bottomless'),
        AvailableHippo.new('picky'),
        AvailableHippo.new('veggie')
      ]
    else
      # free_hippo, playing, game_over
      [
        Player.new('sweetie', 'Judy'),
        Player.new('bottomless', 'Matt', false, true),
        AvailableHippo.new('picky'),
        AvailableHippo.new('veggie')
      ]
    end
  end

end
