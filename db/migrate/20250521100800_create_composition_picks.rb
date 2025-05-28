class CreateCompositionPicks < ActiveRecord::Migration[8.0]
  def change
    create_table :composition_picks do |t|
      t.references :team_composition, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.string :player_name

      t.timestamps
    end
  end
end
