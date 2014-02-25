class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def create
    details = {}
    details[:name] = params[:game][:name]
    details[:min_players] = params[:game][:min_players].to_i
    details[:max_players] = params[:game][:max_players].to_i
    details[:playing_time] = params[:game][:playing_time_minutes].to_i +
                             (params[:game][:playing_time_hours].to_i * 60)
    if new_game = Game.create(details)
      redirect_to "/games/#{new_game.id}"
    else
      render :action => :new
    end
  end

  def show

  end

end
