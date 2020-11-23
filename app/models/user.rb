class User < ApplicationRecord
  self.primary_key = :email

  has_one :infected_user, foreign_key: :user_email
  has_many :logs, foreign_key: :user_email
  has_many :alerts, foreign_key: :user_email
end
