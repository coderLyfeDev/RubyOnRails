class CreateConnected < ActiveRecord::Migration[7.1]
  def change
    create_table :connected do |t|
      t.timestamp :requested_date
      t.bigint :requestor
      t.bigint :user1
      t.bigint :user2

      t.timestamps
    end
  end
end
