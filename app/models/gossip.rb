class Gossip < ApplicationRecord
 has_many :tag_and_gossips
 has_many :tags, through: :tag_and_gossips
 validates :title, presence: true, length: { in: 3..14 }
 validates :content, presence: true
 belongs_to :user
end
