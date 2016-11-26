class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :photo
      t.text :description
      # a post belongs to a user. Thus,
      t.integer :user_id
      t.timestamps
    end
    # add_index table_name, foreign_key
    add_index :posts, :user_id
  end
end
