class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :rep_name
      t.string :rep_email
      t.string :password_digest

      t.timestamps
    end
  end
end
