class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :price
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
