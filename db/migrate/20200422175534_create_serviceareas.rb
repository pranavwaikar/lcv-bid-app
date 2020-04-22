class CreateServiceareas < ActiveRecord::Migration[5.2]
  def change
    create_table :serviceareas do |t|
      t.string :name
      t.string :pincode
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
