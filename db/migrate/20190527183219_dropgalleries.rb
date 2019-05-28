class Dropgalleries < ActiveRecord::Migration[5.2]
  def change
    drop_table :galleries
  end
end
