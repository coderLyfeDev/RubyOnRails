class RenameUserIdInEducation < ActiveRecord::Migration[7.1]
  def change
    rename_column :education, :user_id, :user_info_id
  end
end
