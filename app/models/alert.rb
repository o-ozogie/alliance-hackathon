class Alert < ApplicationRecord
  belongs_to :user, foreign_key: :user_email
  belongs_to :log

  def alerted_at
    super.strftime('%Y-%m-%d %H:%M:%S')
  end
end
