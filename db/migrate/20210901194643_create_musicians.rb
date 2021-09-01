class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.integer :instrument_id
      t.float :hourly_rate

      t.timestamps
    end
  end
end
