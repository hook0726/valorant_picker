class CreateTeamCompositions < ActiveRecord::Migration[8.0]
  def change
    create_table :team_compositions do |t|
      t.references :match, null: false, foreign_key: true
      t.references :map, null: false, foreign_key: true
      t.string :team_name

      t.timestamps
    end
  end
end
