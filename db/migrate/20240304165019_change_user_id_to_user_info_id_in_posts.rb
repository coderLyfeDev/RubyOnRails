class ChangeUserIdToUserInfoIdInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :post, :user_id, :user_info_id
  end
end
