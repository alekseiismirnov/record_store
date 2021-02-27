require 'album'

class Song
  attr_reader :name, :album_id, :id

  @@songs = {}
  @@total = 0

  def initialize(name, album_id, id)
    @name = name
    @album_id = album_id
    @id = id || @@total += 1
  end

  def self.clear
    @@songs = {}
  end

  def self.all
    @@songs.values
  end

  def self.find id
    @@songs[id]
  end

  def self.find_by_album album_id
    @@songs.values.select {|song| song.album_id == album_id}
  end

  def == another
    self.name == another.name and self.album_id == another.album_id
  end

  def save
    @@songs[self.id] = Song.new(self.name, self.album_id, self.id)
  end

  def update(name, album_id)
    @name = name
    @album_id = album_id
    self.save
  end

  def delete
    @@songs.delete self.id
  end

  def album
    Album.find self.album_id
  end
end
