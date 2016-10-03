class User < ActiveRecord::Base
  has_many :reviews
  has_many :comments

  validates :username, presence: true 
end
