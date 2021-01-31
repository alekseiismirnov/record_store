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

    it 'albusm with different artists are not equal' do
      expect(Album.new("Black", "Minisinger") == Album.new("Black", "Maxisinger")).to eq(false)
    end

    it 'albums are equal if equal name, artist and year' do
      expect(Album.new("Black", "Minisinger", 1426) == Album.new("Black", "Minisinger", 1426)).to eq(true)
    end
  end

  it 'year is always string' do
    expect(Album.new("Black", "Minisinger", 1426).year.class).to eq(String)
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

