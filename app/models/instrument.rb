class Instrument < ApplicationRecord
  has_many :musicians
  has_many :project_instruments
  has_many :projects, through: :project_instruments
end
