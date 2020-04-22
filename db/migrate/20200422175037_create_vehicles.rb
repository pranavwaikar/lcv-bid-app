class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.float :capacity
      t.string :permit_type
      t.string :body_type
      t.references :lcvowner, foreign_key: true

      t.timestamps
    end
  end
end
