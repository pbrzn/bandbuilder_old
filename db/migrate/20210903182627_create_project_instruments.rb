class CreateProjectInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :project_instruments do |t|
      t.integer :project_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
