class CreateUserInfo < ActiveRecord::Migration[7.1]
  def change
    create_table :user_info do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :profile_picture
      t.string :role

      t.timestamps
    end
  end
end
