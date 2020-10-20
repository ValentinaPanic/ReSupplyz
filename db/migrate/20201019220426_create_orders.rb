class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :delivery_date
      t.boolean :delivered, default: false

      t.timestamps
    end
  end
end
