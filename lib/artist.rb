require 'pry'
class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(name)
    name.artist = self
    @songs << name
  end

  def self.find_or_create_by_name(name)
    if self.all.find {|artist| artist.name == name}
      self.all.find {|artist| artist.name == name}
    else
      artist = self.new(name)
      artist.save
      artist
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
