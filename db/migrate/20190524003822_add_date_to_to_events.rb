class AddDateToToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date_to, :string
  end
end
