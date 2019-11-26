class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :identity_id, presence: true
  validates :passport_id, presence: true
end