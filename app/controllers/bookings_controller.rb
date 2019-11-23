class BookingsController < ApplicationController
  before_action :set_country, only: %i[show edit update destroy]

  def index
    @search = Booking.ransack(params[:q])
    @bookings = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def edit; end

  def create
    @booking = Booking.new(country_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(country_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_country
    @booking = Booking.find(params[:id])
  end

  def country_params
    params.require(:booking).permit(:number, :package_id, :user_id)
  end
end
