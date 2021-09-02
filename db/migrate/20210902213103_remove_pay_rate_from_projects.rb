class RemovePayRateFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :pay_rate, :float
  end
end
