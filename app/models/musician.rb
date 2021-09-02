class Musician < User
  belongs_to :instrument
  has_many :project_musicians
  has_many :projects, through: :project_musicians
  has_many :contractors, through: :projects
  has_many :genres, through: :projects

  def instrument_name
    self.instrument.name
  end

end
