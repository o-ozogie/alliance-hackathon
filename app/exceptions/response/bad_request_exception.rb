module Response
  module BadRequestException
    class BadTimeFormat < ExceptionCore
      attr_reader :should_raise, :status

      def initialize(time)
        @status = :bad_request
        @should_raise = time.match(/[0-9]{4}-[0-1][0-9]-[0-3][0-9]+$/).nil?

        super('Bad Request : invalid time format')
      end

      def self.except(time)
        super(new(time))
      end
    end
  end
end