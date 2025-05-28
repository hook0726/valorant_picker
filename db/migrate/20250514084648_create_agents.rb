class CreateAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :role
      t.string :image_url
      
      t.timestamps
    end
  end
end
