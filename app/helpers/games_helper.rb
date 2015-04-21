module GamesHelper
  def players_string(game)
    if game.min_players == game.max_players
      if game.min_players == 1
        '1 player'
      else
        "#{game.min_players} players"
      end
    else
      "#{game.min_players}-#{game.max_players} players"
    end
  end

  def play_time_to_string(playing_minutes)
    minutes = playing_minutes % 60
    hours = (playing_minutes - minutes) / 60
    time_string = []
    time_string << stringify_time(hours, 'hour') unless hours == 0
    time_string << stringify_time(minutes, 'minute') unless minutes == 0
    time_string << ' playing time'
    time_string.join(' ')
  end

  def stringify_time(num, word)
    num == 1 ? "1 #{word}" : "#{num} #{word}s"
  end
end
