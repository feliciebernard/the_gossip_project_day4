class Tag < ApplicationRecord
 has_many :tag_and_gossips
 has_many :gossips, through: :tag_and_gossips
end
