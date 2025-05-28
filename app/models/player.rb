class Player < ApplicationRecord
  belongs_to :user
  has_many :available_agents, dependent: :destroy
  has_many :agents, through: :available_agents
  
  accepts_nested_attributes_for :available_agents, allow_destroy: true

  validates :name, presence: true
end
