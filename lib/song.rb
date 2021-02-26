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

  def == another
    self.name == another.name and self.album_id == another.album_id
  end
   
 def save
  @@songs[self.id] = self
 end

   
end
