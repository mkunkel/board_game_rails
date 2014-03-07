class AddImagesToGames < ActiveRecord::Migration
  def change
    add_column :games, :thumbnail, :string
    add_column :games, :image, :string
  end
end
