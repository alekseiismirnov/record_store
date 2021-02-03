require 'rspec'
require 'album'

describe '#Album' do
  before(:each) do
    Album.clear
  end

  describe '.all' do
    it 'is empty at the beginning' do
      expect(Album.all).to eq([])
    end
  end

  describe '.find' do
    it 'finds album by its id' do
      album = Album.new('Bear')
      album2 = Album.new('Tyger')
      album.save
      album2.save
      expect(Album.find(album.id)).to eq(album)
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

  describe '.clear' do
    it 'clears all albums' do
      album = Album.new('Brown')
      album2 = Album.new('Red')
      album.save
      album2.save
      Album.clear
      expect(Album.all).to eq([])
    end
  end
  
  describe '#update' do
    it 'updates album info by id' do
      # does not update database, but this spec is from the textbook
      album = Album.new('Duck')
      album.update('Frog')
      expect(album.name).to eq('Frog')
    end
  end

  describe '#delete' do
    it 'deletes the album by id' do
      album = Album.new('Bat')
      album.save
      album2 = Album.new('Crow')
      album2.save
      album.delete
      expect(Album.all).to eq([album2])
    end
  end
end

