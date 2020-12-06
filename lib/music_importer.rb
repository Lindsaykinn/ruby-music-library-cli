class MusicImporter

    def initialize(path)
        @path = "./spec/fixtures/mp3s"
    end

    def path
        @path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import 
        files.each {|file| Song.create_from_filename(file)}
    end
end