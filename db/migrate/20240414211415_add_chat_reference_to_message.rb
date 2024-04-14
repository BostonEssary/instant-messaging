class AddChatReferenceToMessage < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :chat, null: false
  end
end
