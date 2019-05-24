class AddDatesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date_from, :string
  end
end
