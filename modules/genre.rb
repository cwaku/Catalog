class Genre < Item
  attr_accessor :name
  attr_reader :id, :items

  def intialize(name)
    super(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
  # list all genres
end
