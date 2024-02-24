class CreateUserRole < ActiveRecord::Migration[7.1]
  def change
    create_table :user_role do |t|
      t.bigint :user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
