# frozen_string_literal: true
class Location < ActiveRecord::Base

  NEIGHBORHOODS = [
    "",
    x"Allston/Brighton",
    x"Back Bay",
    x"Beacon Hill",
    x"Brookline Village",
    x"Central Square",
    x"Coolidge Corner",
    x"Davis Square",
    x"Dorchester",
    x"Downtown",
    x"East Cambridge",
    x"Fenway",
    x"Harvard Square",
    x"Inman Square",
    x"Jamaica Plain",
    x"Kendall Square/MIT",
    x"Mission Hill",
    x"North Cambridge",
    x"North End",
    x"Porter Square",
    x"Roxbury",
    x"Seaport",
    x"South Boston",
    x"South End",
    "Union Square",
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
