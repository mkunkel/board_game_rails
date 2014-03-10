class PlaysController < ApplicationController

  def create
    player_names = params[:players].split(",")
    player_names << params[:include_me] if params[:include_me]
    play = Play.create(game_id: params[:game_id], number: player_names.count)
    players = player_names_to_players player_names
    players.each do |player|
      play.players << player
    end
    redirect_to root_path
  end

 # "players"=>"John Doe, Jane Doe, Shigeru Miyamoto",
 # "include_me"=>"joe",
 # "game_id"=>"85",



  def index
    if current_user
      @plays = current_user.player.plays
    else
      @plays = Play.all
    end
  end

  def new
    @player_name = Player.find(current_user.player_id).name
    @game_id = params[:id]
  end

  private

  def player_names_to_players player_names
    player_names.map {|player_name| Player.find_or_create_by(name: player_name.strip)}
  end

end
