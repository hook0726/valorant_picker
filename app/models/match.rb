class Match < ApplicationRecord
  has_many :agent_picks, dependent: :destroy
  has_many :match_maps, dependent: :destroy
  has_many :maps, through: :match_maps
end
