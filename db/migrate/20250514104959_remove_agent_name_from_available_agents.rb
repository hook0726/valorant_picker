class RemoveAgentNameFromAvailableAgents < ActiveRecord::Migration[8.0]
  def change
    remove_column :available_agents, :agent_name, :string
  end
end
