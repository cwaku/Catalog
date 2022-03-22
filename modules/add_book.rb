require_relative './book'

def add_book
  puts 'Enter the book title:'
  title = gets.chomp
  puts 'Enter the book publisher:'
  publisher = gets.chomp
  puts 'Enter the book cover state (good or bad):'
  cover_state = gets.chomp
  puts 'Enter the book publish date:'
  publish_date = gets.chomp
  book = Book.new(title, publisher, cover_state, publish_date)
  puts book.can_be_archived?
end
