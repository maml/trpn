class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.boolean :request

      t.timestamps
    end
  end
end
