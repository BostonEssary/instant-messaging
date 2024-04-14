class AddChatIdAndUserIdAsIndexToChatMembers < ActiveRecord::Migration[7.1]
  def change
    add_index :chat_members, [:chat_id, :user_id], unique: true
  end
end
