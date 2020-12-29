class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :category, null: false
      t.string :name

      t.timestamps
    end
  end
end
