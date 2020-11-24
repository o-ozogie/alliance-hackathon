module Response
  module ConflictException
    class ConflictInfection < ExceptionCore
      attr_reader :should_raise, :status

      def initialize(infected_user)
        @status = :conflict
        @should_raise = !InfectedUser.where(user: infected_user,
                                            infected_at: (Time.now + 9.hours - 2.weeks)..Time.now + 9.hours)
                                     .empty?

        super('Conflict : invalid infection')
      end

      def self.except(infected_user)
        super(new(infected_user))
      end
    end
  end
end