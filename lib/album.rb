class Album
attr_reader :name, :id

  @@albums = {} 
  @@albums_sold = {}
  @@total_rows = 0

  def initialize(name = "Noname", id = nil)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values
  end
  
  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find id
    @@albums[id]
  end

  def self.search name
    Album.all.find {|album| album.name == name}
  end

  def self.sort 
    Album.all.sort { |album, album2| album.name <=> album2.name }
  end

  def self.all_sold
    @@albums_sold.values
  end

  def save
    id = self.id || @@total_rows += 1
    @@albums[self.id] = Album.new(self.name, id)
  end

  def == other_album
    @name == other_album.name 
  end

  def update name
    @name = name
  end

  def delete 
    @@albums.delete self.id
  end

  def sold
    @@albums.delete self.id
    @@albums_sold[self.id] = self
  end
end
