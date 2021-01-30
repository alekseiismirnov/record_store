class Album
attr_reader :name, :artist, :year

  @@albums = []

  def initialize (name = "Noname", artist = "Unknown artist", year = "")
    @name = name
    @artist = artist
    @year = year.to_i
  end

  def self.all
    @@albums 
  end

  def == other_album
    @name == other_album.name and
      @artist == other_album.artist and
      @year == other_album.year
  end
end
