module Response
  module NotFoundException
    class NotFoundSpot < ExceptionCore
      attr_reader :should_raise, :status, :spot

      def initialize(spot_id)
        @status = :not_found
        @spot = Spot.find_by_id(spot_id)
        @should_raise = @spot.nil?

        super('Forbidden : invalid spot')
      end

      def self.except(spot_id)
        super(new(spot_id))
      end
    end
  end
end