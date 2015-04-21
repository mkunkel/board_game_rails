class User < ActiveRecord::Base
  after_create :create_player

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :player
  has_and_belongs_to_many :games

  def self.find_for_database_authentication(conditions)
    where(username: conditions[:email]).first || where(email: conditions[:email]).first
  end

  def create_player
    player = Player.create(name: username)
    self.player_id = player.id
    save
  end
end
