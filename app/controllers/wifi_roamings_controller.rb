class WifiRoamingsController < ApplicationController
  before_action :set_wifi_roaming, only: %i[show edit update destroy]

  def index
    @search        = WifiRoaming.order(name: :asc).ransack(params[:q])
    @wifi_roamings = @search.result(distinct: true).page(params[:page])
  end

  def show; end

  def new
    @wifi_roaming = WifiRoaming.new
  end

  def edit; end

  def create
    @wifi_roaming = WifiRoaming.new(wifi_roaming_params)

    if @wifi_roaming.save
      redirect_to @wifi_roaming, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @wifi_roaming.update(wifi_roaming_params)
      redirect_to @wifi_roaming, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @wifi_roaming.destroy
    redirect_to wifi_roamings_url, notice: t('.notice')
  end

  private

  def set_wifi_roaming
    @wifi_roaming = WifiRoaming.find(params[:id])
  end

  def wifi_roaming_params
    params.require(:wifi_roaming).permit(
      :name, :description, :price
    )
  end
end
