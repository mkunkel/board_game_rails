class PlayersPlay < ActiveRecord::Base
  validates_presence_of :play_id, :player_id
  validates_numericality_of :play_id, :player_id

  has_many :plays, through: :play_id
  has_many :players, through: :player_id
end
