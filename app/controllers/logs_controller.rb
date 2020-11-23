class LogsController < ApplicationController
  before_action :jwt_required
  before_action :user?

  def show
    params.require(%i[date])

    BadRequestException::BadTimeFormat.except(params[:date])
    date = DateTime.parse(params[:date])
    render json: @user.logs.where(created_at: date..(date + 1.days - 1.seconds)).map { |log|
      { visited_at: log.created_at,
        address: log.spot.address,
        spot_name: log.spot.name,
        latitude: log.spot.latitude,
        longitude: log.spot.longitude }
    }, status: :ok
  end

  def visit
    params.require(%i[spot_id])

    spot = NotFoundException::NotFoundSpot.except(params[:spot_id]).spot
    Log.create!(spot: spot, user: @user, created_at: now)

    render status: :created
  end
end
