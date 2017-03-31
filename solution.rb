# I started working on a module but didn't get far enough to use it

class Viewer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    ALL.find { |viewer| viewer.full_name == name }
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_rating(score, movie)
    Rating.new(score, self, movie)
  end

end


class Rating
  attr_accessor :score, :viewer, :movie

  ALL = []

  def initialize(score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    ALL << self
  end

  def self.all
    ALL
  end
  
end


class Movie
  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    ALL.find { |movie| movie.title == title}
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self }
  end

  def average_rating
    sum = 0
    ratings.each { |rating| sum += rating.score }
    sum.to_f / ratings.length
  end

  def viewers
    ratings.collect { |rating| rating.viewer }
  end

end