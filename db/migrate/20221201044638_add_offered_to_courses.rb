class AddOfferedToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :offered, :string
  end
end
