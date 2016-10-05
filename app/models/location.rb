class Location < ActiveRecord::Base

  NEIGHBORHOODS = ["", "Downtown", "Back Bay", "South End", "Seaport", "Southie", "Roxbury", "Dorchester",
                  "Beacon Hill", "Allston", "Brighton", "Mission Hill", "Jamaica Plain", "Kenmore", "North End",
                  "West End", "Fenway", "Kendall", "Central", "Harvard", "Porter", "Davis", "Inman", "Union", "Coolidge Corner",
                  "Clevelend Circle", "Dudley"]


  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
end
