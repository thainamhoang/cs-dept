class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :domain
      t.string :prerequisite
      t.float :credit

      t.timestamps
    end
  end
end
