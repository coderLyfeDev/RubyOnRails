class AddUserInfoToPosts < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :post, :user_info, column: :user_info_id
  end
end
