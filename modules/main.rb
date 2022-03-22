# require './music'
# require_relative './add_book'
require_relative './book'

class Main
  def initialize
    @books = []
    @labels = []
  end

  def start
    puts 'Welcome to the App'
    puts 'Choose an option below:'

    loop do
      option = list_options
      break if option == 10

      list_books if option == 1
      add_musica if option == 8
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
      puts "publisher: #{book.publisher}, cover state: #{book.cover_state}, publish date: #{book.publish_date}"
    end
  end
end

main = Main.new
main.start
