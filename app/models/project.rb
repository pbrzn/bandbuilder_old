class Project < ApplicationRecord
  belongs_to :contractor
  belongs_to :genre
  has_many :project_musicians
  has_many :musicians, through: :project_musicians
  has_many :instruments, through: :musicians
end
