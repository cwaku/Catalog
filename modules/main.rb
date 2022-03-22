# require './music'
# require_relative './add_book'
require_relative './book'
require_relative './label'

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
      list_labels if option == 5
      add_book if option == 7
      add_musica if option == 8
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
    puts 'Empty labels list' if @labels.empty?
    @labels.each do |label|
      puts "Label: #{label.title}, Color: #{label.color}"
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
    @books.push(Book.new(title, publisher, cover_state, publish_date))
    @labels.push(Label.new(label_title, label_color))
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Empty books list' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end
end

main = Main.new
main.start
