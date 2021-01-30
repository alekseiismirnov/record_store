class Album
attr_reader :name

  @@albums = []

  def initialize name
    @name = name
  end

  def self.all
    @@albums 
  end

  def == other_album
    @name == other_album.name
  end
end
