class RenameCampsToCourses < ActiveRecord::Migration
  def change
    rename_table :camps, :courses
  end
end
