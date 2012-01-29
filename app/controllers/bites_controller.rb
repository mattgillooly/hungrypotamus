class BitesController < ApplicationController

  def create
    Pusher['hippo1'].trigger('bite', {})
  end

end
