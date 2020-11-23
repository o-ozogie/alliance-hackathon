# frozen_string_literal: true

require 'jwt_base'
require './app/exceptions/exception_core'
require './app/exceptions/response/unauthorized_exception'

module Response
  module ForbiddenException
    JWT_BASE = JWTBase.new(ENV['SECRET_KEY_BASE'], 1.days, 2.weeks)

    class Forbidden < ExceptionCore
      attr_reader :should_raise, :status, :payload

      def initialize(authorization)
        @status = :forbidden

        header = UnauthorizedException::UnauthorizedToken.new(authorization)

        raise header if header.should_raise

        @payload = JWT_BASE.jwt_required(header.jwt)
        @should_raise = @payload.blank?

        super('Forbidden : invalid token')
      end

      def self.except(authorization)
        super(new(authorization))
      end
    end

    def user?
      @user = User.find_by_email(@payload['sub'])
      raise ForbiddenException::Forbidden, request.headers['authorization'] unless @user
    end
  end
end
