class AddDeletedStatusToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :deleted, :boolean
  end
end
