class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :appelation
      t.string :vintage
      t.decimal :price
      t.string :image_url
      t.text :description
      t.integer :quantity
      t.integer :varietal_id

      t.timestamps
    end
  end
end
