class CreateCareerInterest < ActiveRecord::Migration[7.1]
  def change
    create_table :career_interest do |t|
      t.bigint :career_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
