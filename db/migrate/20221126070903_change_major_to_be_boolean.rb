class ChangeMajorToBeBoolean < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :major, :boolean
  end
end
