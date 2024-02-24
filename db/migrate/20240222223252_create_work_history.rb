class CreateWorkHistory < ActiveRecord::Migration[7.1]
  def change
    create_table :work_history do |t|
      t.boolean :current_position
      t.string :employer_name
      t.timestamp :end_date
      t.string :location
      t.string :position
      t.timestamp :start_date
      t.bigint :user_id

      t.timestamps
    end
  end
end
