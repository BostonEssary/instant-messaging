class RemoveReceiverFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :messages, :receiver

  end
end
