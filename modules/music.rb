require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && on_spotify == true
  end
end

# ms = MusicAlbum.new(true, 'comedy','2019-04-03')
# print ms.genre
