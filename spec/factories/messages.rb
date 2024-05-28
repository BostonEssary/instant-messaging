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
FactoryBot.define do
  factory :message do
    body { "MyText" }
    read { false }
    edited { false }
  end
end
