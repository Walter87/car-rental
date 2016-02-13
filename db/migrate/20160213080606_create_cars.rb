class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.text :description
      t.string :comfort_class

      t.timestamps null: false
    end
  end
end
