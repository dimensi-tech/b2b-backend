# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_country, only: %i[show edit update destroy]

  def index
    @search   = Booking.ransack(params[:q])
    @bookings = @search.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    # Adult
    @adult_biodatas   = Biodatas::PassengerBiodataService.new(biodata_ids: @booking.adult_bio_ids).call
    @adult_identities = Identities::PassengerIdentityService.new(identity_ids: @booking.identity_ids).call
    @adult_passports  = Passports::PassengerPassportService.new(identity_ids: @booking.identity_ids).call
    @adult_savings    = Savings::PassengerSavingService.new(
      booking_id: @booking.id, source_ids: @booking.identity_ids, source_type: 'adult'
    ).call

    # Child
    @child_biodatas  = Biodatas::PassengerBiodataService.new(biodata_ids: @booking.child_bio_ids).call
    @child_passports = Passports::PassengerPassportService.new(identity_ids: @booking.child_passport_ids).call
    @child_savings   = Savings::PassengerSavingService.new(
      booking_id: @booking.id, source_ids: @booking.child_passport_ids, source_type: 'child'
    ).call
  end

  def new
    @booking = Booking.new
  end

  def edit; end

  def create
    @booking = Booking.new(country_params)

    if @booking.save
      redirect_to @booking, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @booking.update(country_params)
      redirect_to @booking, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: t('.notice')
  end

  def report
    resource_filename(params)
    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] =
          "attachment;filename=#{@filename}.xlsx"
      end
    end
  end

  private

  def set_country
    @booking = Booking.find(params[:id])
  end

  def resource_filename(params)
    @search      = Booking.all
    @search      = @search.ransack(params[:q])
    @bookings    = @search.result(distinct: true)
    @filename    = "Laporan Booking - #{Date.today}"
    @filters     = params[:q]
    @export_date = Time.now
  end

  def country_params
    params.require(:booking).permit(:number, :package_id, :user_id)
  end
end
