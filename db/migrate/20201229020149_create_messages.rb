class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.boolean :seen, null: false, default: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
