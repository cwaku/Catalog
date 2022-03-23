require_relative '../modules/game.rb'
require_relative '../modules/author.rb'
require 'json'

class SaveGames
  def initialize(games)
    @games = games
  end

  def save
    json_data = []
    @games.each do |game|
      json_data << ({multiplayer: game.multiplayer, publish_date: game.publish_date, last_played_at: game.last_played_at, author: {first_name: game.author.first_name, last_name: game.author.last_name}})
    end
    File.open('./data/games.json', 'w') { |f| f.write JSON.generate(json_data) }
  end
end
