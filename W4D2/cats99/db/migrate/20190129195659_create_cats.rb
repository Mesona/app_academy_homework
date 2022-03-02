class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :color
      t.string :name, null: false 
      t.string :sex, limit: 1 
      t.text :description
      t.date :birth_date, null: false
      t.timestamps
    end
  end
end
