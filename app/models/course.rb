class Course < ActiveRecord::Base

  has_many :camp_offerings
  has_many :camp_surveys

  def self.activecamps
    self.find [8,12,19,33,4,5,2,32,31,3,9,41,38,18,7,20,39,42,44,13,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67]
  end

  def self.onlinecamps
    self.find [46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68]
  end

  def self.accessible_attributes
   ["age", "capacity", "description", "price", "title", "show_description", "girls_only", "online"]
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      camp = find_by_id(row["id"]) || new
      camp.attributes = row.to_hash.slice(*accessible_attributes)
      camp.save!
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |camp|
        csv << camp.attributes.values_at(*column_names)
      end
    end
  end
end
