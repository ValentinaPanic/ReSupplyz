class CreateProductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :product_orders do |t|
      t.references :product_id, null: false, foreign_key: true
      t.references :order_id, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
