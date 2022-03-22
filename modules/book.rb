require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(title, publisher, cover_state, publish_date)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end

book = Book.new('The Hobbit', 'Houghton Mifflin', 'good', '1937')
print book.can_be_archived?
