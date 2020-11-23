class InfectionsController < ApplicationController
  before_action :jwt_required
  before_action :user?

  ALERT_PER_PAGE = 10

  def alert
    params.require(%i[page])

    render json: Alert.where(users: @user)
                      .offset(ALERT_PER_PAGE * (params[:page] - 1))
                      .limit(ALERT_PER_PAGE)
                      .map { |alert|
                   log = alert.log
                   {
                     visited_at: log.created_at,
                     address: log.spot.address,
                     spot_name: log.spot.name,
                     latitude: log.spot.latitude,
                     longitude: log.spot.longitude
                   }
                 }, status: :ok
  end

  def related_with_infection(infected_user)
    infected_logs = infected_user.logs.where(created_at: (now - 2.weeks)..now)
    pre_infected_logs = infected_logs.map { |infected_log| Log.where(created_at: infected_log.created_at..now) }
  end
end

