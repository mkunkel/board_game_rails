class Game < ActiveRecord::Base
  validates_presence_of :name, :min_players, :max_players, :playing_time
  validates_uniqueness_of :name
  validates_numericality_of :min_players, :max_players, :playing_time
  validate :min_players_less_than_or_equal_to_max_players

  has_many :plays
  has_many :friends, through: :plays

  private

  def min_players_less_than_or_equal_to_max_players
    self.errors.add(:max_players, "must be greater than or equal to min players") if max_players.to_i < min_players.to_i
    self.errors.add(:min_players, "must be less than or equal to max players") if min_players.to_i > max_players.to_i
  end
end
