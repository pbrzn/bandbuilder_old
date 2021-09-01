class ProjectMusician < ApplicationRecord
  belongs_to :musician
  belongs_to :project
end
