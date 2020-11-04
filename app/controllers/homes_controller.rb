class HomesController < ApplicationController
  def index
    if current_user.role.name == 'Travel Agent'
      @search   = Booking.where(travel_partner_id: current_user.travel_partner_id)
                         .ransack(params[:q])
      @bookings = @search.result(distinct: true).page(params[:page])
    elsif current_user.role.name == 'Admin'
      @search   = Booking.ransack(params[:q])
      @bookings = @search.result(distinct: true).page(params[:page])
    end
  end
end