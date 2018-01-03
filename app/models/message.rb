class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
end

def message_time
  created_at.strftime("%m/%d/%y at %l:%M %p")
 end
