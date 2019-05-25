class CreateGallery < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.json :avatars
    end
  end
end
