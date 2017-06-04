# Please copy/paste all three classes into this file to submit your solution!
require "pry"

class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find { |movie| movie.title == title }
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self }
  end

  def viewers
    self.ratings.map { |rating| rating.viewer }
  end

  def average_rating
    self.ratings.map { |rating| rating.score }.reduce(:+).to_f / (self.ratings.size)
  end

end

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

class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find { |viewer| viewer.full_name == name }
  end

  def create_rating(movie, score)
    Rating.new(movie, score, self)
  end

end
