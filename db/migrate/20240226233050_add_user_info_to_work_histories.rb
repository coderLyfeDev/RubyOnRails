class AddUserInfoToWorkHistories < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :work_history, :user_info, column: :user_id
  end
end
