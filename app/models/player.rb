class Player < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_one :user
  has_many :plays_players
  has_and_belongs_to_many :plays
  has_many :games, through: :plays
end
