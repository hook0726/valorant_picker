class AddUrlToMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :matches, :url, :string
  end
end
