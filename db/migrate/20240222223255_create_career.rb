class CreateCareer < ActiveRecord::Migration[7.1]
  def change
    create_table :career do |t|
      t.string :category
      t.string :salary_range
      t.string :sub_category

      t.timestamps
    end
  end
end
