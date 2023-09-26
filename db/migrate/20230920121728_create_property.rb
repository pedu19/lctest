class CreateProperty < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :property_id
      t.string :council_property_number
      t.string :full_address
      t.float :latitude
      t.float :longitude
      t.string :postcode

      t.timestamps
    end
  end
end
