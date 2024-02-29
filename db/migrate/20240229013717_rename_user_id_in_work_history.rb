class RenameUserIdInWorkHistory < ActiveRecord::Migration[7.1]
  def change
    rename_column :work_history, :user_id, :user_info_id
  end
end
