class IconsController < ApplicationController
  before_action :set_icon, only: %i[show edit update destroy]

  def index
    @search = Icon.ransack(params[:q])
    @icons  = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @icon = Icon.new
  end

  def edit; end

  def create
    @icon = Icon.new(icon_params)

    if @icon.save
      redirect_to @icon, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @icon.update(icon_params)
      redirect_to @icon, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @icon.destroy
    redirect_to icons_url, notice: t('.notice')
  end

  private

  def set_icon
    @icon = Icon.find(params[:id])
  end

  def icon_params
    params.require(:icon).permit(:code, :description)
  end
end
