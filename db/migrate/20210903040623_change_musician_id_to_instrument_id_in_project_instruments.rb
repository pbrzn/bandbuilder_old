class ChangeMusicianIdToInstrumentIdInProjectInstruments < ActiveRecord::Migration[6.1]
  def change
    rename_column :project_instruments, :musician_id, :instrument_id
  end
end
