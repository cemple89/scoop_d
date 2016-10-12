# frozen_string_literal: true
class Location < ActiveRecord::Base

  NEIGHBORHOODS = [
    "",
    "Allston/Brighton",
    "Back Bay",
    "Beacon Hill",
    "Brookline Village",
    "Central Square",
    "Coolidge Corner",
    "Davis Square",
    "Dorchester",
    "Downtown",
    "East Cambridge",
    "Fenway",
    "Harvard Square",
    "Inman Square",
    "Jamaica Plain",
    "Kendall Square/MIT",
    "Mission Hill",
    "North Cambridge",
    "North End",
    "Porter Square",
    "Roxbury",
    "Seaport",
    "South Boston",
    "South End",
    "Union",
    "West End"
                  ]

  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
