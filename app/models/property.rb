class Property < ApplicationRecord
  def intersecting_lga
    query = <<-SQL
      SELECT property.property_id, vic_lga.lga_name
      FROM property
      JOIN vic_lga ON ST_Intersects(ST_SetSRID(ST_MakePoint(property.longitude, property.latitude), 4326), vic_lga.geom)
      WHERE property.property_id = #{self.property_id};
    SQL

    result = ActiveRecord::Base.connection.exec_query(query)
    result.first&.lga_name
  end
end