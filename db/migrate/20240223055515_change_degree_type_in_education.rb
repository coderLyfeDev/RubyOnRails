class ChangeDegreeTypeInEducation < ActiveRecord::Migration[7.1]
  def change
    change_column :education, :degree, :string
  end
end
