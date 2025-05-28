class CreateAvailableAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :available_agents do |t|
      t.string :agent_name
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
