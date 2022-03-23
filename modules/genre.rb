class Genre 
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @name = name
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def music_album
    @items.each do |song|
      return song.move_to_archive, @id, song.genre.name if song.genre == self
    end
  end
  
end
