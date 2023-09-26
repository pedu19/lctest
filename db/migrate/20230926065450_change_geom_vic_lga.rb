class ChangeGeomVicLga < ActiveRecord::Migration[7.0]
  def change
    def self.up
      add_column :vic_lgas, :geom, :geometry, srid: 4326, type: 'MULTIPOLYGON'
    end
  
    def self.down
      remove_column :vic_lgas, :geom, :geometry, srid: 4283, type: 'MULTIPOLYGON'
    end
  end
end
