class CreateMaps < ActiveRecord::Migration[8.0]
  def change
    create_table :maps do |t|
      t.references :match, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
