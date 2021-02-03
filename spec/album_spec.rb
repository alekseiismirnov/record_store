require 'rspec'
require 'album'

describe '#Album' do
  describe '.all' do
    it 'is empty at the beginning' do
      expect(Album.all).to eq([])
    end
  end

  describe '#==' do
    it 'albums with same names are equal' do
      expect(Album.new("Blue") == Album.new("Blue")).to eq(true)
    end
  end

  describe '#save' do
    it 'saves albums' do
      album = Album.new("Black")
      album2 = Album.new("Blue")
      album.save
      album2.save
      expect(Album.all).to eq([album, album2])
    end
  end
end

