class RemoveTimeFromMatches < ActiveRecord::Migration[8.0]
  def change
    remove_column :matches, :map1 , :string
    remove_column :matches, :map2 , :string
    remove_column :matches, :map3 , :string
    add_column :matches, :patch , :string
  end
end
