class CreateEducation < ActiveRecord::Migration[7.1]
  def change
    create_table :education do |t|
      t.boolean :degree
      t.boolean :graduated
      t.boolean :highest_degree
      t.string :school_name
      t.string :state
      t.bigint :user_id

      t.timestamps
    end
  end
end
