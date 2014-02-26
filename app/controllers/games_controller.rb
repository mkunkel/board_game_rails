class GamesController < ApplicationController

  def index
    @games = current_user.games.to_a unless current_user.games.nil?
  end

  def create
    if current_user.games << create_game(params[:game])
      redirect_to "/games/#{current_user.games.last.id}"
    else
      render :action => :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def create_game params
    Game.find_or_create_by(name: params[:name]) do |game|
      game.name = params[:name]
      game.min_players = params[:min_players].to_i
      game.max_players = params[:max_players].to_i
      game.playing_time = params[:playing_time_minutes].to_i +
                          (params[:playing_time_hours].to_i * 60)
    end
  end

end
