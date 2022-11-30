class ChangeMinorToBeInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :minor, :integer
  end
end
