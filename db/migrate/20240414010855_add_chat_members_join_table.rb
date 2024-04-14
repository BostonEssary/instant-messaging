class AddChatMembersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_members do |t|
      t.belongs_to :user
      t.belongs_to :chat
      t.timestamps
    end
  end
end
