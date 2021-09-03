class ChangeTableNameFromProjectMusiciansToProjectInstruments < ActiveRecord::Migration[6.1]
  def change
    rename_table :project_musicians, :project_instruments
  end
end
