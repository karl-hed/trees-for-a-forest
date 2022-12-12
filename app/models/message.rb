class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :chatroom


  # scope :between, -> (sender_id, recipient_id) do
  #   where("(conversations.sender_id = ? AND conversations.recipient_id =?)
  #   OR (conversations.sender_id = ? AND conversations.recipient_id =?)",
  #   sender_id, recipient_id, recipient_id, sender_id)
  # end

  # def message_time
  #   created_at.strftime("%m/%d/%y at %l:%M %p")
  # end
end
