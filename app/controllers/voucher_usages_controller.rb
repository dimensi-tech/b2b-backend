class VoucherUsagesController < ApplicationController
  before_action :set_voucher_usage, only: %i[show edit update destroy]

  def index
    @search         = VoucherUsage.ransack(params[:q])
    @voucher_usages = @search.result(distinct: true).includes(:customer, :voucher)
                             .page(params[:page]).per(15)
  end

  def show; end

  def new
    @travel_destination = VoucherUsage.new
  end

  def edit; end

  def create
    @travel_destination = VoucherUsage.new(travel_destination_params)

    if @travel_destination.save
      redirect_to @travel_destination, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @travel_destination.update(travel_destination_params)
      redirect_to @travel_destination, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @travel_destination.destroy
    redirect_to voucher_usages_url, notice: t('.notice')
  end

  private

  def set_voucher_usage
    @travel_destination = VoucherUsage.find(params[:id])
  end

  def travel_destination_params
    params.require(:travel_destination).permit(:country_id, :destination)
  end
end
