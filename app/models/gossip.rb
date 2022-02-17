
#Gossip appartient à un User et a plusieurs tags

class Gossip < ApplicationRecord

  validates :title, presence: true, length: { in: 3..20 }
  validates :content, presence: true
  validates :user_id, presence: true 
  
  belongs_to :user
  has_many :affiliations
  has_many :tags, through: :affiliations
  has_many :likes
  has_many :comments

end
