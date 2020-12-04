# frozen_string_literal: true

class UserManagement < ApplicationRecord
  belongs_to :travel_partner

  validates :email, :name, :password, presence: true
  validates :email, uniqueness: true

  after_create :assign_user
  after_update :update_user_login

  def assign_user
    role        = Role.find_or_create_by(name: 'Travel Agent')
    user        = User.find_by(email: email) || User.new
    user_params = { email: email, password: password, travel_partner_id: travel_partner_id, role_id: role.id }

    user.present? ? user.update(user_params) : user.save
  end

  def update_user_login
    user = User.find_by(email: email)
    user.update(email: email, password: password, travel_partner_id: travel_partner_id) if user.present?
  end
end
