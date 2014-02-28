class PlaysController < ApplicationController

  def index
    @plays = Play.all
  end

  def new
    @player_name = Player.find(current_user.player_id).name
  end

end
