class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :pronouns
      t.string :email
      t.string :phone
      t.string :office
      t.string :link

      t.timestamps
    end
  end
end
