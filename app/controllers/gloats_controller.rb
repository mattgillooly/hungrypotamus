class GloatsController < ApplicationController

  def create
    Pusher['hippo1'].trigger('gloat', {})
    head :ok
  end

end
