class TeamComposition < ApplicationRecord
  belongs_to :match
  belongs_to :map

  has_many :composition_picks, dependent: :destroy
end
