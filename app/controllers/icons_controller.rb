class IconsController < ApplicationController
  before_action :set_icon, only: [:show, :edit, :update, :destroy]

  def index
    @search = Icon.ransack(params[:q])
    @icons = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show
  end

  def new
    @icon = Icon.new
  end

  def edit
  end

  def create
    @icon = Icon.new(icon_params)

    respond_to do |format|
      if @icon.save
        format.html { redirect_to @icon, notice: 'Icon was successfully created.' }
        format.json { render :show, status: :created, location: @icon }
      else
        format.html { render :new }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @icon.update(icon_params)
        format.html { redirect_to @icon, notice: 'Icon was successfully updated.' }
        format.json { render :show, status: :ok, location: @icon }
      else
        format.html { render :edit }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @icon.destroy
    respond_to do |format|
      format.html { redirect_to icons_url, notice: 'Icon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_icon
      @icon = Icon.find(params[:id])
    end

    def icon_params
      params.require(:icon).permit(:code, :description)
    end
end
