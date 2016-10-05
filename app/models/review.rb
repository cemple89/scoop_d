class Review < ActiveRecord::Base

  RATINGS = [[1, "one scoop"],
            [2, "two scoops"],
            [3, "three scoops"],
            [4, "four scoops"],
            [5, "five scoops"]
          ]

  belongs_to :location
  belongs_to :user

  validates :user_id, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: RATINGS.map { |rating| rating[0] } }
  validates :flavor, presence: true
end
