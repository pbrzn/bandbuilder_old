class Instrument < ApplicationRecord
  has_many :musicians
  has_many :projects, through: :musicians
end
