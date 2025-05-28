class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.string :title
      t.string :subtitle
      t.string :tean1
      t.string :team2
      t.string :result
      t.date :date
      t.string :map1
      t.string :map2
      t.string :map3

      t.timestamps
    end
  end
end
