class BitesController < ApplicationController

  def create
    Pusher['hippo1'].trigger('bite', {})
    head :ok
  end

end
