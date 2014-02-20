class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.text :notes
      t.integer :game_id

      t.timestamps
    end
  end
end
