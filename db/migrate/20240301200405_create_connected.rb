class CreateConnected < ActiveRecord::Migration[7.1]
  def change
    create_table :connected do |t|
      t.string :connections
      t.bigint :user_info_id

      t.timestamps
    end
  end
end
