class AddPhoneNumberToLcvowners < ActiveRecord::Migration[5.2]
  def change
    add_column :lcvowners, :phone_number, :string
  end
end
