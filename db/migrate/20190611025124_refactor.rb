class Refactor < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :token
    remove_column :users, :password_sent_at
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
  end
end
