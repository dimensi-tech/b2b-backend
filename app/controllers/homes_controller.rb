class HomesController < ApplicationController
  def index
    @search   = Booking.order('created_at desc').limit(10).ransack(params[:q])
    @bookings = @search.result(distinct: true).page(params[:page]).per(15)
  end
end