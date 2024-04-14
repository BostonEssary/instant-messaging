# == Schema Information
#
# Table name: chat_members
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_chat_members_on_chat_id              (chat_id)
#  index_chat_members_on_chat_id_and_user_id  (chat_id,user_id) UNIQUE
#  index_chat_members_on_user_id              (user_id)
#
class ChatMember < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :user, uniqueness: { scope: :chat, message: "A user can only be in a chat once." }
end
