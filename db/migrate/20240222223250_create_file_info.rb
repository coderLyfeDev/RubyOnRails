class CreateFileInfo < ActiveRecord::Migration[7.1]
  def change
    create_table :file_info do |t|
      t.string :file_name
      t.bigint :user_id

      t.timestamps
    end
  end
end
