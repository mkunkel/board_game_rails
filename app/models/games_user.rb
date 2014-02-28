class GamesUser < ActiveRecord::Base
  validates_presence_of :game_id, :user_id
  validates_numericality_of :game_id, :user_id

  belongs_to :game
  belongs_to :user
end
