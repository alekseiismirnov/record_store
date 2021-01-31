class Album
attr_reader :name, :artist, :year, :id

  @@albums = {} 
  @@total_rows = 0

  def initialize (name = "Noname", artist = "Unknown artist", year = "", id=nil)
    @name = name
    @artist = artist
    @year = year.to_s
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.artist, self.year, self.id)
  end

  def == other_album
    @name == other_album.name and
      @artist == other_album.artist and
      @year == other_album.year
  end
end
