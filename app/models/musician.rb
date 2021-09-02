class Musician < User
  attr_accessor :rate

  belongs_to :instrument
  has_many :project_musicians
  has_many :projects, through: :project_musicians
  has_many :contractors, through: :projects
  has_many :genres, through: :projects

  # def rate=(rate)
  #   @rate = rate
  # end
  #
  # def rate
  #   @rate
  # end

end
