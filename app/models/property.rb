class Property < ApplicationRecord
  scope :intersecting_lga, ->(property) {joins('LEFT JOIN vic_lga ON ST_Intersects(ST_SetSRID(ST_MakePoint(properties.longitude, properties.latitude), 4326), vic_lga.geom)')}
    
  # self.table_name = "property"
  # def intersecting_lga
  #   query = <<~SQL
  #     SELECT
  #       property.property_id,
  #       vic_lga.lga_name
  #     FROM
  #       property
  #     LEFT JOIN
  #       vic_lga
  #     ON
  #       ST_Intersects(
  #         ST_SetSRID(ST_MakePoint(property.longitude, property.latitude), 4326),
  #         vic_lga.geom
  #       );
  #   SQL

  #   result = ActiveRecord::Base.connection.exec_query(query)

  # end
end