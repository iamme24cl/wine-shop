class CreateVarietals < ActiveRecord::Migration[6.1]
  def change
    create_table :varietals do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
