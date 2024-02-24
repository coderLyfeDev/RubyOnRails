class CreatePost < ActiveRecord::Migration[7.1]
  def change
    create_table :post do |t|
      t.integer :likes
      t.integer :shares
      t.integer :comments
      t.string :content
      t.string :scope
      t.string :post_type
      t.string :tagged_users
      t.bigint :user_id

      t.timestamps
    end
  end
end
