# frozen_string_literal: true

class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[report]
  before_action :set_booking, only: %i[show edit update destroy detail_savings]

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

  def show
    # Adult
    @adult_biodatas   = Biodatas::PassengerBiodataService.new(biodata_ids: @booking.adult_bio_ids).call
    @adult_identities = Identities::PassengerIdentityService.new(identity_ids: @booking.identity_ids).call
    @adult_passports  = Passports::PassengerPassportService.new(identity_ids: @booking.identity_ids).call

    # Child
    @child_biodatas  = Biodatas::PassengerBiodataService.new(biodata_ids: @booking.child_bio_ids).call
    @child_passports = Passports::PassengerPassportService.new(identity_ids: @booking.child_passport_ids).call
  end

  def detail_savings
    @savings = nil
    @savings = Savings::PassengerSavingService.new(
      booking_id: @booking.id, source_ids: [params[:source_ids]], source_type: params[:source_type]
    ).call if @booking.id.present? && params[:source_ids].present? && params[:source_type].present?

    respond_to do |format|
      format.js
    end
  end

  def new
    @booking = Booking.new
  end

  def edit; end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
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
    @search   = Booking.ransack(params[:q])
    @bookings = @search.result(distinct: true)
    @filters  = params[:q]

    # Check total records bookings will exported
    total_identities = @bookings.pluck(:identity_ids).map {|identity_ids| identity_ids.compact.length}.sum
    total_passports  = @bookings.pluck(:child_passport_ids).map {|passport_ids| passport_ids.compact.length}.sum

    if (total_identities + total_passports) > 30 && params[:attachment].nil?
      ExportReportJob.perform_later(params.to_unsafe_h)
      redirect_to bookings_path, notice: t('.notice')
    else
      respond_to_format
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def respond_to_format
    @file_name = I18n.t('bookings.report.page_header')

    respond_to do |format|
      format.html
      format.xlsx do
        if params[:attachment]
          render filename: "#{@file_name} - #{Date.today}.xlsx", template: "bookings/report_attachment"
        else
          response.headers['Content-Disposition'] = "attachment;filename=#{@file_name} - #{Date.today}.xls"
        end
      end
    end
  end

  def booking_params
    params.require(:booking).permit(:number, :package_id, :user_id)
  end
end
