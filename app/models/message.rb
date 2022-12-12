class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :chatroom

  def sender?(a_user)
    sender.id == a_user.id
  end
end
