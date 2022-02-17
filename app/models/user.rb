
#Un User appartient à une ville et peut avoir plusieurs gossips

class User < ApplicationRecord

  belongs_to :city
  has_many :gossips
  has_many :likes
  has_many :comments

  validates :password, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true

end
