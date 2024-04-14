class AddSenderAndReceiverToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :sender, null: false
    add_reference :messages, :receiver, null: false

    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :receiver_id
  end
end
