class AddMatchTimeToMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :matches, :match_time, :datetime
    remove_column :matches, :date
  end
end
