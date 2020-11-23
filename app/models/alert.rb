class Alert < ApplicationRecord
  belongs_to :user, foreign_key: :user_email
  belongs_to :log
end
