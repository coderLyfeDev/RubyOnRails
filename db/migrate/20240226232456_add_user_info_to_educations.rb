class AddUserInfoToEducations < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :education, :user_info, column: :user_id
  end
end
