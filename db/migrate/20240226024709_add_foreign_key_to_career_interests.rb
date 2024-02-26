class AddForeignKeyToCareerInterests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :career_interest, :career, column: :career_id
  end
end

