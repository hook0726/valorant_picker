class AddMapToAgentPicks < ActiveRecord::Migration[8.0]
  def change
    add_reference :agent_picks, :map, null: false, foreign_key: true
  end
end
