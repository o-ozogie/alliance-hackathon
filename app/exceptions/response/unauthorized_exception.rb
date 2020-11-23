# frozen_string_literal: true

require './app/exceptions/exception_core'

module Response
  module UnauthorizedException
    class UnauthorizedToken < ExceptionCore
      attr_reader :should_raise, :status, :jwt

      def initialize(authorization)
        @status = :unauthorized

        authorization = authorization&.split(' ').to_a
        @jwt = authorization[1] if authorization[0] == 'Bearer'
        @should_raise = @jwt.nil?

        super('Unauthorized : undefined token')
      end

      def self.except(authorization)
        super(new(authorization))
      end
    end

    class UnauthorizedUser < ExceptionCore
      attr_reader :should_raise, :status

      def initialize
        @status = :unauthorized
        @should_raise = true

        super('Unauthorized : invalid access')
      end

      def self.except
        super(new)
      end
    end
  end
end
