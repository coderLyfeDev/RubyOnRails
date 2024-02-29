class AddForeignKeyToCareerInterestsUpdate < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :career_interest, :user_info, column: :user_info_id
  end
end
