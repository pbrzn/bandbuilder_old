class AddBudgetToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :budget, :float
  end
end
