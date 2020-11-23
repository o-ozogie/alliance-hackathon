class SpotsController < ApplicationController
  before_action :jwt_required
  before_action :user?

  def show
    params.require(%i[spot_id])

    spot = NotFoundException::NotFoundSpot.except(params[:spot_id]).spot

    render json: {
      address: spot.address,
      spot_name: spot.name,
      latitude: spot.latitude,
      longitude: spot.longitude
    }, status: :ok
  end
end
