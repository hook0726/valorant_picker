class RemoveMapFromAgentPicks < ActiveRecord::Migration[8.0]
  def change
    remove_column :agent_picks, :map, :string
  end
end
