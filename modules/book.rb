require_relative './item'
require_relative './label'

class Book < Item
  attr_accessor :publisher, :cover_state, :title

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
