class GamesController < ApplicationController

  def index
    @games = current_user.games.to_a unless current_user.games.nil?
  end

  def create
    details = {}
    details[:name] = params[:game][:name]
    details[:min_players] = params[:game][:min_players].to_i
    details[:max_players] = params[:game][:max_players].to_i
    details[:playing_time] = params[:game][:playing_time_minutes].to_i +
                             (params[:game][:playing_time_hours].to_i * 60)
    if current_user.games << Game.create(details)
      redirect_to "/games/#{current_user.games.last.id}"
    else
      render :action => :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end
