class AddGenreIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :genre_id, :integer
  end
end
