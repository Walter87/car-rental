class CreateRentalOrders < ActiveRecord::Migration
  def change
    create_table :rental_orders do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :car, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
