require_relative '../modules/label'
require_relative '../modules/book'

describe Label do
  context 'Testing Label class' do
    label = Label.new 'Test', 'red'
    book = Book.new 'The Hobbit', 'Houghton Mifflin', 'good', '1937-03-22'

    it 'Label should be instance of Label' do
      expect(label).to be_instance_of Label
    end

    it "Label's title should be correct" do
      expect(label.title).to eq 'Test'
    end

    it "Label's color should be correct" do
      expect(label.color).to eq 'red'
    end

    it 'Items array should work correctly' do
      label.add_item(book)
      expect(label.items.size).to eq 1
    end

    it 'Items array should have a correct type' do
      label.add_item(book)
      expect(label.items[0]).to eq book
    end

    it 'Item should have a correct type of author' do
      label.add_item(book)
      expect(label.items[0].label).to be_instance_of Label
    end
  end
end
