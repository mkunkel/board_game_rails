class Play < ActiveRecord::Base
  validates_presence_of :game_id
  validates_numericality_of :game_id

  belongs_to :game
  has_and_belongs_to_many :players
end
