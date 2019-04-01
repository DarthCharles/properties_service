class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string  :offer_type
      t.string  :property_type
      t.string  :zip_code, null: false
      t.string  :city, null: false
      t.string  :street
      t.string  :house_number
      t.decimal :lng, precision: 10, scale: 6
      t.decimal :lat, precision: 10, scale: 6
      t.integer :construction_year
      t.decimal :number_of_rooms
      t.string  :currency
      t.decimal :price
    end
  end
end
