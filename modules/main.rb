# require './music'
# require_relative './add_book'
require_relative './book'
require_relative './label'
require_relative 'game'
 require_relative 'music'

class Main
  def initialize
    @books = []
    @games = []
    @authors = []
    @albums = []
    @genres = []
    # @labels = []
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def start
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/PerceivedComplexity
    puts 'Welcome to the App'
    puts 'Choose an option below:'

    loop do
      option = list_options
      break if option == 10

      list_books if option == 1
      list_labels if option == 5
      list_games if option == 3
      list_labels if option == 5
      list_authors if option == 6
      list_albums if option == 2
      load_albums if option == 2
      create_album if option == 8
      save_albums  if option == 8
      list_genres if option == 4
      add_game if option == 9
      add_book if option == 7
    end
  end

  def list_options
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '10. Exit'

    gets.chomp.to_i
  end

  def list_labels
    puts 'Empty labels list' if @books.empty?
    @books.each do |book|
      puts "Label: #{book.label.title}, Color: #{book.label.color}"
    end
  end

  def add_book
    puts 'Enter the book title:'
    title = gets.chomp
    puts 'Enter the book publisher:'
    publisher = gets.chomp
    puts 'Enter the book cover state (good or bad):'
    cover_state = gets.chomp
    puts 'Enter the book publish date:'
    publish_date = gets.chomp
    puts 'Enter label title:'
    label_title = gets.chomp
    puts 'Enter label color:'
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    book = Book.new(title, publisher, cover_state, publish_date)
    book.label = new_label

    @books.push(book)
    # @labels.push(Label.new(label_title, label_color))
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Empty books list' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end

  def list_authors
    if @authors.empty?
      puts 'Author list is empty'
      return
    end

    @authors.each_with_index do |author, i|
      puts "#{i + 1}. First name: #{author.first_name}, Last name: #{author.last_name}"
    end
  end

  def add_game
    puts 'Enter multiplayer: '
    multiplayer = gets.chomp

    puts 'Enter the last played date [YYYY-MM-DD]: '
    last_played_at = gets.chomp

    puts 'Enter the publish date [YYYY-MM-DD]: '
    publish_date = gets.chomp

    @games << Game.new(multiplayer, last_played_at, publish_date)
    puts 'Game added successfully!'
  end

  def list_games
    if @games.empty?
      puts 'No games added!'
      return
    end

    @games.each_with_index do |game, i|
      # rubocop:disable Metrics/Layout/LineLength
      puts "#{i + 1}. Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
      # rubocop:enable Metrics/Layout/LineLength
    end
  end
end

def create_album
  puts 'Enter album genre'
  genre = gets.chomp
  puts 'publish date'
  publish_date = gets.chomp
  puts ' On Spotify?[y/n]'
  on_spotify = gets.chomp == 'y' || false
  @albums.push(MusicAlbum.new(publish_date, on_spotify))
  @genres.push(Genre.new(genre))
  puts "New Album Created!"
  save_albums
  save_genres
end

def list_albums
    if @albums.length.zero?
      puts 'No albums found!Kindly add an album'
    else
      @albums.map do |album|
        @genres.map do |gen|
          puts " On_Spotify: #{album.on_spotify}, Publish Date: #{album.publish_date}, Genre:#{gen.name}"
      end
    end
   end
  end

  #save data

  def save_albums
  File.open('./data/music_albums.json', 'w') do |file|
    a_store = @albums.map do |album|
      { on_spotify: album.on_spotify, Publish_date: album.publish_date }
    end
    file.puts(JSON.pretty_generate(a_store))
  end
end

def save_genres
  File.open('./data/genres.json', 'w') do |file|
    g_store = @genres.map do |gen|
      {GenreId: gen.id, GenreName: gen.name }
    end
    file.puts(JSON.pretty_generate(g_store))
  end
end

def list_genres
  if @genres.length.zero?
    puts "No Genres configured!Please add a genre"
  else
    @genres.map do |genre|
      puts "ID:#{genre.id}, GenreName:#{genre.name}"
    end
  end
end

#load data
  def load_albums
  if File.exist?('./data/music_albums.json')
    albums = JSON.parse(File.read('./data/music_albums.json'))
    albums.map do |album|
      MusicAlbum.new(album['on_spotify'].to_s, album['Publish_date'].to_s)
    end
  else
    []
  end
end



main = Main.new
main.start
