# require './music'
# require_relative './add_book'
require_relative './book'
require_relative 'game'

class Main
  def initialize
    @books = []
    @games = []
    @labels = []
  end

  def start
    puts 'Welcome to the App'
    puts 'Choose an option below:'

    loop do
      option = list_options
      break if option == 10

      list_books if option == 1
      list_games if option == 3
      add_musica if option == 8
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

  def add_book
    puts 'Enter the book title:'
    title = gets.chomp
    puts 'Enter the book publisher:'
    publisher = gets.chomp
    puts 'Enter the book cover state (good or bad):'
    cover_state = gets.chomp
    puts 'Enter the book publish date:'
    publish_date = gets.chomp
    @books.push(Book.new(title, publisher, cover_state, publish_date))
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Empty books list' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end

  def add_game
    puts "Enter multiplayer: "
    multiplayer = gets.chomp

    puts "Enter the last played date [YYYY-MM-DD]: "
    last_played_at = gets.chomp
    
    puts "Enter the publish date [YYYY-MM-DD]: "
    publish_date = gets.chomp

    @games << Game.new(multiplayer, last_played_at, publish_date)
    puts 'Game added successfully!'
  end

  def list_games
    if @games.empty?
      puts "No games added!" 
      return
    end

    @games.each_with_index do |game, i|
      puts "#{i + 1}. Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end
end

main = Main.new
main.start
