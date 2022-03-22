require './item'

class Label < Item
  attr_accessor :title, :color

  def initialize(title, color)
    super(genre, author, source, label, publish_date)
    @id = rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
