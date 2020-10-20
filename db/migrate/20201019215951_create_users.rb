class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :company_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
