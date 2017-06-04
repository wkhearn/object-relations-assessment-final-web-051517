class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  @@all = []

  def initialize(movie, score, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    @@all < self
  end

  def self.all
    @@all
  end

end
