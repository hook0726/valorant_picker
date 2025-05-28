class RemoveMapidFromMatches < ActiveRecord::Migration[8.0]
  def change
    remove_column :matches, :map_id, :string
  end
end
