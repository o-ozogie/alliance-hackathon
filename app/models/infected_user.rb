class InfectedUser < ApplicationRecord
  belongs_to :user, foreign_key: :user_email

  def infected_at
    super.strftime('%Y-%m-%d %H:%M:%S')
  end

  def relation_with_infection(now)
    infected_logs = user.logs
                        .where(created_at: (now - 2.weeks)..now)
                        .each_with_object([]) do |infected_log, obj|
      existing_log = obj.find_all { |e| e.spot.id == infected_log.spot.id }

      if existing_log.blank?
        obj << infected_log
      else
        spot_logs = [infected_log, *existing_log]
        earliest_log = spot_logs.max_by(&:created_at)
        obj -= spot_logs
        obj << earliest_log
      end
    end

    infected_logs.flat_map { |infected_log| infected_log.spot.logs.where(created_at: infected_log.created_at..now) }
  end


end
