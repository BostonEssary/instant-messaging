# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text
#  deleted    :boolean
#  edited     :boolean
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint           not null
#  sender_id  :bigint           not null
#
# Indexes
#
#  index_messages_on_chat_id    (chat_id)
#  index_messages_on_sender_id  (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (sender_id => users.id)
#
class Message < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :chat
    has_many_attached :attachments

    validates :body, presence: true

    after_create_commit {
        broadcast_append_to :messages_list,
                                                    target: "messages_for_chat_#{chat.id}",
                                                    partial: 'messages/message',
                                                   locals: { message: self }
    }

    after_update_commit do
        broadcast_update_to :messages_list,
                            target: "message_#{id}",
                            partial: 'messages/message',
                            locals: { message: self}
    end

    def formatted_created_at
        created_at.strftime("%m/%d/%Y %I:%M%p")
    end



end
