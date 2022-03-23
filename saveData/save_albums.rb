module  SaveAlbums
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


end