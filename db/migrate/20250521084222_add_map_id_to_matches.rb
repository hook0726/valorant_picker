class AddMapIdToMatches < ActiveRecord::Migration[8.0]
  def change
    add_reference :matches, :map, null: true, foreign_key: true
  end
end
