class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
