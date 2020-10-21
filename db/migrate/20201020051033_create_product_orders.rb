class CreateProductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :product_orders do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
