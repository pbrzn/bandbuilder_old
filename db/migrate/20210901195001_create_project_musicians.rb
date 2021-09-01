class CreateProjectMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :project_musicians do |t|
      t.integer :project_id
      t.integer :musician_id

      t.timestamps
    end
  end
end
