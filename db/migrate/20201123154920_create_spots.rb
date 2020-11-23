class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.decimal :longitude, scale: 10, precision: 15
      t.decimal :latitude, scale: 10, precision: 15
    end
  end
end
