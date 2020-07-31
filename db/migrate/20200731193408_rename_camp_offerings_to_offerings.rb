class RenameCampOfferingsToOfferings < ActiveRecord::Migration
  def change
    rename_table :camp_offerings, :offerings
  end
end
