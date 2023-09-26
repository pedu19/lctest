
class Api::V1::VicLgasController < ApplicationController
  # respond_to :json

  def index
    
    @vic_lgas = VicLga.limit(10)
    @properties = Property.limit(10)
    search_results = {
      vic_lgas: @vic_lgas,
      properties: @properties
    }

    render json: search_results
  end
  

  def show
    @vic_lga = VicLga.find_by_id(params[:id])
    if @vic_lga.nil?
      render json: { error: '404 VICLGA not found' }, status: :not_found
    else
      render json: @vic_lga, status: :ok
    end

  end

  def show_property
    @property = Property.find_by_id(params[:id])
    # intersecting_lga(@property)
    if @property.nil?
      render json: { error: '404 Property not found' }, status: :not_found
    else
      intersecting_lga(@property)
    end
  end

  def intersecting_lga(property)
    # scope :intersecting_lga, ->(property) {joins('LEFT JOIN vic_lga ON ST_Intersects(ST_SetSRID(ST_MakePoint(properties.longitude, properties.latitude), 4326), vic_lga.geom)')}
    

    render json: property

  end

  
  private

  def vic_lga_params
    params.require(:vic_lga).permit(
                                  :id,
                                  :gid,
                                  :pfi,
                                  :lga_code,
                                  :gaz_lga,
                                  :gazregn,
                                  :abslgacode,
                                  :pfi_cr,
                                  :ufi,
                                  :ufi_cr,
                                  :ufi_old,
                                  :geom)

  end

  def property_params
    params.require(:property).permit(
                                  :id,
                                  :property_id,
                                  :council_property_number,
                                  :full_address,
                                  :latitude,
                                  :longitude,
                                  :postcode,
                                  :geom)
  end
end
   