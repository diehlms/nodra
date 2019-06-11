class AddPasswordResetsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string
    add_column :users, :password_sent_at, :datetime
  end
end
