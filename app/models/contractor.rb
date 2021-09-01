class Contractor < User
  has_many :projects
  has_many :musicians, though: :projects
  has_many :genres, through: :projects
end
