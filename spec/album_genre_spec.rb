require_relative '../modules/music'
require_relative '../modules/genre'

describe MusicAlbum do
  context 'Should test MusicAlbum class' do
    album = MusicAlbum.new '2020-2-2 ', true
    genre = Genre.new 'pop'

    it 'album should be MusicAlbum instantiation' do
      expect(album).to be_instance_of MusicAlbum
    end

    it 'genre should be Genre instantiation' do
      expect(genre).to be_instance_of Genre
    end

    it 'should return  correct spotify status ' do
      expect(album.publish_date.year).to eq 2020
    end

    it 'should return  correct date ' do
      expect(album.on_spotify).to eq true
    end

    it 'should return  correct genre name ' do
      expect(genre.name).to eq 'pop'
    end
  end
end
