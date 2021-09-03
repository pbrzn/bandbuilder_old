class ProjectMusician < ApplicationRecord
  belongs_to :project
  belongs_to :musician
end
