require 'rspec'
require 'pry'
require 'album'
require 'song'

describe '#Song' do
  before :each do
    Album.clear()
    Song.clear()
    @album = Album.new("Giant Steps", nil)
    @album.save()
  end

  describe '#==' do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new("Naima", @album.id, nil)
      song2 = Song.new("Naima", @album.id, nil)
      expect(song).to(eq(song2))
    end

   it("Songs with different albums id are not same") do
      song = Song.new("Naima", @album.id, nil)
      song2 = Song.new("Naima", 100500, nil)
      expect(song == song2).to eq(false)
    end
  end
end
