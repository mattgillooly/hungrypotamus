class ChatEventsController < ApplicationController

  def create
    ChatEvent.create!(:actor => 'anonymous',
                      :message => params[:message])

    head :ok
  end

end
