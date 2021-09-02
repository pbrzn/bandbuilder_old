class Contractor < User
  has_many :projects
  has_many :musicians, through: :projects
  has_many :genres, through: :projects
end
