class AddColumnPhotoUrlToGames < ActiveRecord::Migration
  def change
    add_column :games, :photo_url, :string
  end
end
