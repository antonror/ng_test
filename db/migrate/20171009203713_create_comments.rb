class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false, index: true
      t.integer :movie_id, null: false, index: true
      t.string :content, null: false, index: true

      t.timestamps
    end
    add_index :comments, [:user_id, :movie_id], unique: true
  end
end
