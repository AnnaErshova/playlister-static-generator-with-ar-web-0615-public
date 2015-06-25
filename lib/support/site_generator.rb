class SiteGenerator

  def initialize(path)
    @path = path
  end

  def rendered_path
    @path
  end

  def build_index
    template = ERB.new(File.read("app/views/index.html.erb"))
    result = template.result(binding)
    @artists = Artist.all
    @songs = Song.all 
    @genres = Genre.all
    FileUtils.mkdir_p(rendered_path)
      File.write("#{rendered_path}/index.html", result)
  end

  def build_artists_index
    template = ERB.new(File.read("app/views/artists/index.html.erb"))
        @artists = Artist.all
    result = template.result(binding)
    FileUtils.mkdir_p("#{rendered_path}/artists")
    File.write("#{rendered_path}/artists/index.html", result)
  end

  def build_artist_page
    @artists = Artist.all
    FileUtils.mkdir_p("#{rendered_path}/artists")
    content = ERB.new(File.read("app/views/artists/show.html.erb"))
    @artists.each do |artist|
      @artist = artist
      result = content.result(binding)
      File.write("#{rendered_path}/artists/#{artist.to_slug}.html", result)
    end
  end

  def build_genres_index
    template = ERB.new(File.read("app/views/genres/index.html.erb"))
    @genres = Genre.all
    result = template.result(binding)
    FileUtils.mkdir_p("#{rendered_path}/genres")
    File.write("#{rendered_path}/genres/index.html", result)
  end

  def build_genre_page
    @genres = Genre.all
    FileUtils.mkdir_p("#{rendered_path}/genres")
    content = ERB.new(File.read("app/views/genres/show.html.erb"))
    @genres.each do |genre|
      @genre = genre
      result = content.result(binding)
      File.write("#{rendered_path}/genres/#{genre.to_slug}.html", result)
    end
  end

  def build_songs_index
    template = ERB.new(File.read("app/views/songs/index.html.erb"))
    @songs = Song.all
    result = template.result(binding)
    FileUtils.mkdir_p("#{rendered_path}/songs")
    File.write("#{rendered_path}/songs/index.html", result)
  end

  def build_song_page
    @songs = Song.all
    FileUtils.mkdir_p("#{rendered_path}/songs")
    content = ERB.new(File.read("app/views/songs/show.html.erb"))
    @songs.each do |song|
      @song = song
      result = content.result(binding)
      File.write("#{rendered_path}/songs/#{song.to_slug}.html", result)
    end
  end

end # end class