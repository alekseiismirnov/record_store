require 'album'

class Song
  attr_reader :name, :album_id

  @@total = 0

  def initialize(name, album_id, id)
    @name = name
    @album_id = album_id
    @id = id || @@total += 1
  end

  def self.clear
  end

  def == another
    self.name == another.name and self.album_id == another.album_id
  end
    
end
