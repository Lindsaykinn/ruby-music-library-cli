class Artist

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)    
        self.new(name)
    end

    def songs
       @songs
    end

    def add_song(song)
       song.artist = self unless song.artist
       songs << song unless songs.include?(song)
    end

    def genres
        songs.collect {|s| s.genre}.uniq
    end

end