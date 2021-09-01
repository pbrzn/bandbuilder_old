class Genre < ApplicationRecord
  has_many :projects
  has_many :contractors, through: :projects
  has_many :musicians, through: :projects
end
