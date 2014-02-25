class GamesUser < ActiveRecord::Base
  validates_presence_of :game_id, :user_id
  validates_numericality_of :game_id, :user_id

  has_many :games, through: :game_id
  has_many :users, through: :user_id
end
