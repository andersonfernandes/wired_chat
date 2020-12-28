class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.integer :target_id, null: false
      t.string :target_type, null: false
      t.boolean :seen, null: false, default: false
      t.references :sender, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
