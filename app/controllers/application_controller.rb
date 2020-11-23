class ApplicationController < Jets::Controller::Base
  include Response

  rescue_from 'ActionController::ParameterMissing' do |e|
    render json: { error_message: e.message }, status: :bad_request
  end

  rescue_from 'BadRequestException::BadTimeFormat',
              'UnauthorizedException::UnauthorizedToken',
              'UnauthorizedException::UnauthorizedUser',
              'ForbiddenException::Forbidden',
              'NotFoundException::NotFoundSpot' do |e|
    render_error(e)
  end

  protected

  def jwt_required
    @payload = ForbiddenException::Forbidden.except(request.headers['authorization']).payload
  end

  def now
    Time.now + 9.hours
  end

  private

  def render_error(error)
    render json: { error_message: error.message },
           status: error.status
  end

  def render(**options)
    json = options[:json] || { message: 'successful request' }
    status = options[:status] || :ok

    super json: json, status: status
  end
end
