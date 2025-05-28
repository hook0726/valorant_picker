class CreateAgentPicks < ActiveRecord::Migration[8.0]
  def change
    create_table :agent_picks do |t|
      t.references :match, null: false, foreign_key: true
      t.string :team_name
      t.string :player_name
      t.string :agent_name
      t.string :map

      t.timestamps
    end
  end
end
