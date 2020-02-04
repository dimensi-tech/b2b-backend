class BookingsController < ApplicationController
  before_action :set_country, only: %i[show edit update destroy]

  def index
    @search   = Booking.ransack(params[:q])
    @bookings = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def edit; end

  def create
    @booking = Booking.new(country_params)

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update
    if @booking.update(country_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_country
    @booking = Booking.find(params[:id])
  end

  def country_params
    params.require(:booking).permit(:number, :package_id, :user_id)
  end
end
