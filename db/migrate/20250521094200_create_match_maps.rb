class CreateMatchMaps < ActiveRecord::Migration[8.0]
  def change
    create_table :match_maps do |t|
      t.references :match, null: false, foreign_key: true
      t.references :map, null: false, foreign_key: true

      t.timestamps
    end
  end
end
