require_relative '../modules/game'
require_relative '../modules/author'
require 'json'

# rubocop:disable Metrics/Layout/LineLength

module PreserveGames
  def load_games
    rb_data = []

    if File.exist?('./data/games.json')
      JSON.parse(File.read('./data/games.json')).each do |game|
        game_class = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
        game_class.author = Author.new(game['author']['first_name'], game['author']['last_name'])
        rb_data << game_class
      end
    else
      File.write('./data/games.json', [])
    end
    rb_data
  end

  def save_games(games)
    json_data = []
    games.each do |game|
      json_data << ({ multiplayer: game.multiplayer, publish_date: game.publish_date,
                      last_played_at: game.last_played_at, author: { first_name: game.author.first_name, last_name: game.author.last_name } })
    end
    File.write('./data/games.json', JSON.generate(json_data))
  end
end

# rubocop:enable Metrics/Layout/LineLength
