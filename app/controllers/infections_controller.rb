class InfectionsController < ApplicationController
  before_action :jwt_required
  before_action :user?

  ALERT_PER_PAGE = 10

  def alert
    render json: Alert.where(user: @user).map { |alert|
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

  def infected
    params.require(%i[email])

    ConflictException::ConflictInfection.except(@user)
    infected_user = InfectedUser.create!(user: @user, infected_at: now)
    infected_user.relation_with_infection(now).each do |log|
      InfectionsMailer.warning(log)
      Alert.create!(alerted_at: now, log: log, user: log.user)
    end
    InfectionsMailer.hand_over(Log.where(user: @user, created_at: (now - 2.weeks)..now))
    render
  end
end

