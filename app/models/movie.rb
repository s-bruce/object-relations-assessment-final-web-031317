class Movie
  # extend Netflix::ClassMethods
  
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
