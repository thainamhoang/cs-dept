class ChangeMajorToBeInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :major, :integer
  end
end
