class ProjectInstrument < ApplicationRecord
  belongs_to :instrument
  belongs_to :project
end
