class AddDirectorIdToMovies < ActiveRecord::Migration[5.1]
  def change
    #adds column to movies table called director_id of type integer
    #need to call rails db:migrate in console to make sure this runs
    add_column :movies, :director_id, :integer
  end
end
