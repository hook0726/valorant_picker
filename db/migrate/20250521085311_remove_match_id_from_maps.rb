class RemoveMatchIdFromMaps < ActiveRecord::Migration[8.0]
  def change
    remove_reference :maps, :match, null: false, foreign_key: true
  end
end
