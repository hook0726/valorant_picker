class Map < ApplicationRecord
  has_many :match_maps, dependent: :destroy
  has_many :matches, through: :match_maps

end
