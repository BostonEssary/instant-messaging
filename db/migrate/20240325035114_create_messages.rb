class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :read
      t.boolean :edited

      t.timestamps
    end
  end
end
