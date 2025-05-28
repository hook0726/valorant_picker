class RenameTean1ColumnToMatch < ActiveRecord::Migration[8.0]
  def change
    rename_column :matches, :tean1, :team1
  end
end
