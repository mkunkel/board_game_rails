class AddNumberToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :number, :integer
  end
end
