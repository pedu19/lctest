class AddGeomToVicLga < ActiveRecord::Migration[7.0]
  def change

    add_column :vic_lgas, :geom, :geometry, srid: 4283, type: 'MULTIPOLYGON'
    
  end
end
