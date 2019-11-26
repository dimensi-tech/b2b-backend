class VouchersController < ApplicationController
  before_action :set_voucher, only: %i[show edit update destroy]

  def index
    @search   = Voucher.order(name: :asc).ransack(params[:q])
    @vouchers = @search.result(distinct: true).page(params[:page])
  end

  def show; end

  def new
    @voucher = Voucher.new
  end

  def edit; end

  def create
    @voucher = Voucher.new(voucher_params)

    if @voucher.save
      redirect_to @voucher, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @voucher.update(voucher_params)
      redirect_to @voucher, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @voucher.destroy
    redirect_to vouchers_url, notice: t('.notice')
  end

  private

  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

  def voucher_params
    params.require(:voucher).permit(
      :code, :name, :start_date, :end_date, :percentage, :max_amount,:max_usage,
      :status
    )
  end
end
