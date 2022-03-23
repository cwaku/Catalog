require_relative '../modules/book'
require_relative '../modules/label'
require 'json'

module PreserveBooks
  def load_books
    data = []

    if File.exist?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).each do |book|
        book_class = Book.new(book['title'], book['publisher'], book['cover_state'], book['publish_date'])
        book_class.label = Label.new(book['label']['title'], book['label']['color'])
        data << book_class
      end
    else
      File.write('./data/books.json', [])
    end
  end

  def save_books(books)
    data = []

    books.each do |book|
      data << ({ title: book.title, publisher: book.publisher, cover_state: book.cover_state,
                 publish_date: book.publish_date, label: { title: book.label.title, color: book.label.color } })
    end
    File.write('./data/books.json', JSON.generate(data))
  end
end
