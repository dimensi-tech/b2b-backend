class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  def index
    @search = Ad.ransack(params[:q])
    @ads    = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @ad = Ad.new
  end

  def edit; end

  def create
    @ad = Ad.new(ad_params)

    if @ad.save
      redirect_to @ad, notice: 'Ad was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ad.update(ad_params)
      redirect_to @ad, notice: 'Ad was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ad.destroy
    redirect_to ads_url, notice: 'Ad was successfully destroyed.'
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :image, :status, :url)
  end
end
