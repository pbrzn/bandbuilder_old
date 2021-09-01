class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :contractor_id
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date_time
      t.float :pay_rate

      t.timestamps
    end
  end
end
