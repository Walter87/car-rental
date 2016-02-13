class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :city
      t.string :zip_code
      t.text :notes

      t.timestamps null: false
    end
  end
end
