class Album
attr_reader :name, :id

  @@albums = {} 
  @@total_rows = 0

  def initialize(name = "Noname", id = nil)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def == other_album
    @name == other_album.name 
  end
end
