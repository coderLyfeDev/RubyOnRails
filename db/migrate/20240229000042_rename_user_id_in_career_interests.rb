class RenameUserIdInCareerInterests < ActiveRecord::Migration[7.1]
  def change
    rename_column :career_interest, :user_id, :user_info_id
  end
end
