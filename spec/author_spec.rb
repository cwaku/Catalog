require_relative '../modules/author.rb'
require_relative '../modules/game.rb'

describe Author do
  context 'Testing Author class' do
    author = Author.new 'Anuar', 'Shaidenov'
    game = Game.new 'multiplayer', '2022-03-22', '1998-12-1'

    it "Author should be instance of Author" do
      expect(author).to be_instance_of Author
    end

    it "Author's first name should be correct" do
      expect(author.first_name).to eq 'Anuar'
    end

    it "Author's last name should be correct" do
      expect(author.last_name).to eq 'Shaidenov'
    end

    it 'Items array should work correctly' do
      author.add_item(game)
      expect(author.items.size).to eq 1
    end

    it 'Items array should have a correct type' do
      author.add_item(game)
      expect(author.items[0]).to eq game
    end
  end
end