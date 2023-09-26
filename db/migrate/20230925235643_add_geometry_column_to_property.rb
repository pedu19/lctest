class AddGeometryColumnToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :geom, :geometry, srid: 4326

    execute <<-SQL
      UPDATE properties
      SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);
    SQL
  end
end
