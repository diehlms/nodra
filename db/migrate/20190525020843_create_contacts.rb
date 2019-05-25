class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :fleet
      t.string :email
      t.string :phone_number
    end
  end
end
