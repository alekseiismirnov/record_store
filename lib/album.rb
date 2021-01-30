class Album
attr_reader :name, :artist

  @@albums = []

  def initialize (name = "Noname", artist = "Unknown artist")
    @name = name
    @artist = artist
  end

  def self.all
    @@albums 
  end

  def == other_album
    @name == other_album.name and
      @artist == other_album.artist
  end
end
