class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :image_url
      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
  end
end
