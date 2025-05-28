class AddAgentIdToAvailableAgents < ActiveRecord::Migration[8.0]
  def change
    add_column :available_agents, :agent_id, :integer
  end
end
