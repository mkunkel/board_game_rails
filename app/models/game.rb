class Game < ActiveRecord::Base
  validates_presence_of :name, :min_players, :max_players, :playing_time
  validates_uniqueness_of :name
  validates_numericality_of :min_players, :max_players, :playing_time
  validates_numericality_of :bgg_id, allow_nil: true
  validate :min_players_less_than_or_equal_to_max_players

  has_many :plays
  has_many :players
  has_and_belongs_to_many :users

  scope :played_by_player, ->(f) { f.games }
  scope :played_by_players, ->(fs) { fs.map(&:games).inject(:&) }
  scope :not_played_by_player, ->(f) { all - f.games }
  scope :not_played_by_players, ->(fs) { all - fs.map(&:games).flatten }
  scope :by_number_of_players, ->(num) { where("#{num} BETWEEN min_players AND max_players") }

  private

  def min_players_less_than_or_equal_to_max_players
    errors.add(:max_players, 'must be greater than or equal to min players') if max_players.to_i < min_players.to_i
    errors.add(:min_players, 'must be less than or equal to max players') if min_players.to_i > max_players.to_i
  end
end
