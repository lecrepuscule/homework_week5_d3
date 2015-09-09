class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :studio
      t.date :release_date
      t.string :genre
      t.float :rating 

      t.timestamps
    end
  end
end
