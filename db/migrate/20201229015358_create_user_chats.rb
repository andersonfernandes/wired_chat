class CreateUserChats < ActiveRecord::Migration[6.1]
  def change
    create_table :user_chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.integer :role, null: false

      t.timestamps
    end
  end
end
