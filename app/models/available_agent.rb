class AvailableAgent < ApplicationRecord
  belongs_to :player
  belongs_to :agent
  
  validates :agent_id, presence: true
end
