class Location < ActiveRecord::Base
  has_many :locationreviews
  has_many :reviews, through: :locationreviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
end
