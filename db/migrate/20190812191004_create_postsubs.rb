class CreatePostsubs < ActiveRecord::Migration[5.2]
  def change
    create_table :postsubs do |t|
      t.integer :sub_id
      t.integer :post_id
      t.index :sub_id
      t.index :post_id
    end
    add_index :postsubs, [:post_id, :sub_id], unique: true
  end
end
