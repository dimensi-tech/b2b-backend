class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[show edit update destroy]

  def index
    @search    = Merchant.ransack(params[:q])
    @merchants = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @merchant = Merchant.new
  end

  def edit; end

  def create
    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      redirect_to @merchant, notice: 'Merchant was successfully created.'
    else
      render :new
    end
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'Merchant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @merchant.destroy
    redirect_to merchants_url, notice: 'Merchant was successfully destroyed.'
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name, :description)
  end
end
