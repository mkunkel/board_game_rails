class GamesController < ApplicationController

  def add
    if params[:format] == "bgg"
      bgg = BggApi.new
      game = bgg_to_game(bgg.thing({id: params[:id]}))
    else
      game = Game.find(params[:id])
    end
    game.save
    if current_user.games << game
      redirect_to games_path
    else
      render :action => :new
    end
  end

  def create
    if current_user.games << create_game(params[:game])
      redirect_to "/games/#{current_user.games.last.id}"
    else
      render :action => :new
    end
  end

  def index
    @games = current_user.games.to_a unless current_user.games.nil?
  end

  def remove
    current_user.games.destroy(params[:id])
    redirect_to games_path
  end

  def search
    @results = nil
    if params[:name]
      bgg = BggApi.new
      bgg_results = bgg.search({query: params[:name], type: 'boardgame'})["item"]
      local_results = Game.where("name like ?", "%#{params[:name]}%")
      @results = format_results bgg_results, local_results
    end
  end

  def show
    if params[:format] == "bgg"
      bgg = BggApi.new
      @game = bgg_to_game(bgg.thing({id: params[:id]}))

    else
      @game = Game.find(params[:id])
    end
  end

  def suggest
    case params[:commit]
    when "Suggest for this number"
      number_of_players = params[:game][:number_of_players]
      word = number_of_players == 1 ? "#player" : "players"
      @for_string = "#{number_of_players.to_s} #{word}"
      @suggestions = Game.by_number_of_players(number_of_players)
    when "Suggest for these players"
      names = params[:game][:players].split(",").map{|x| x.strip}
      players = names_to_players(names)
      user = params[:game][:include_me].to_i
      @for_string = names.join(" and ")
      @for_string = names[0..-2].join(", ") + " and " + names[-1] if names.count > 2
      if params[:game][:played] == "Show only games that are new to these people"
        @suggestions = Game.by_number_of_players(players.count + user).not_played_by_players(players)
      else
        @suggestions = Game.by_number_of_players(players.count + user).played_by_players(players)
      end
      # binding.pry
    end
      render "/games/suggestions" unless params[:commit].nil?
  end

  private

  def bgg_to_game bgg
    game = Game.new
    bgg = bgg["item"].first
    game.bgg_id = bgg["id"]
    game.name = bgg["name"].select{|x| x if x["type"] == "primary"}.first["value"]
    game.min_players = bgg["minplayers"].first["value"]
    game.max_players = bgg["maxplayers"].first["value"]
    game.playing_time = bgg["playingtime"].first["value"]
    game.description = bgg["description"].first
    game
  end

  def create_game params
    Game.find_or_create_by(name: params[:name]) do |game|
      game.name = params[:name]
      game.min_players = params[:min_players].to_i
      game.max_players = params[:max_players].to_i
      game.playing_time = params[:playing_time_minutes].to_i +
                          (params[:playing_time_hours].to_i * 60)
      game.description = params[:description]
    end
  end

  def combine_results bgg_results, local_results
    local_names = local_results.map{|x| x[:name].downcase}
    bgg_results = bgg_results.select{|x| x unless local_names.include?(x[:name].downcase)}
    bgg_results + local_results
  end

  def format_bgg_results bgg_results
    results = []
    bgg_results.each do |bgg_result|
      results << {name: bgg_result["name"].last["value"], bgg_id: bgg_result["id"]}
    end
    results
  end

  def format_local_results local_results
    results = []
    local_results.each do |local_result|
      results << {name: local_result.name, game_id: local_result.id}
    end
    results
  end

  def format_results bgg_results, local_results
    bgg_results = format_bgg_results(bgg_results)
    local_results = format_local_results(local_results)
    combine_results bgg_results, local_results
  end

  def names_to_players names
    names.map{|name| Player.find_or_create_by(name: name)}
  end
end
