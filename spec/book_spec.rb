require_relative '../modules/book'

describe Book do
  context 'Testing Book class' do
    book = Book.new 'The Hobbit', 'Houghton Mifflin', 'good', '1937-03-22'

    it 'Book should be instance of Book' do
      expect(book).to be_instance_of Book
    end

    it "Book's title should be correct" do
      expect(book.title).to eq 'The Hobbit'
    end

    it "Book's publisher should be correct" do
      expect(book.publisher).to eq 'Houghton Mifflin'
    end

    it "Book's cover state should be correct" do
      expect(book.cover_state).to eq 'good'
    end

    it "Book's publish date should be correct" do
      expect(book.publish_date.year).to eq 1937
    end

    it 'Book should be able to be archived' do
      expect(book.can_be_archived?).to be true
    end
  end
end
