
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
  private

  def show
    @vic_lga = VicLga.find_by_id(params[:id])
    if @vic_lga.nil?
      render json: { error: '404 VICLGA not found' }, status: :not_found
    else
      render json: @vic_lga, status: :ok
    end

  end

  def show_property
    property = Property.find_by_id(params[:id])
    lga_name = property.intersecting_lga
  end

  


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
end
   