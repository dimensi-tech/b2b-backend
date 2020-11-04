# frozen_string_literal: true

class UserManagement < ApplicationRecord
  after_create :assign_user
  after_update :update_user_login

  def assign_user
    User.create(email: email, password: password, travel_partner_id: travel_partner_id)
  end

  def update_user_login
    user = User.find(email: email)
    user.update(email: email, password: password, travel_partner_id: travel_partner_id)
  end
end
