class ChatEvent < ActiveRecord::Base

  scope :most_recent, order('created_at DESC').limit(4)

end
