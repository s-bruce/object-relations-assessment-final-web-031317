class Viewer
  # extend Netflix::ClassMethods

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
