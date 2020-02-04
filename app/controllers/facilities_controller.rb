class FacilitiesController < ApplicationController
  before_action :set_facility, only: %i[show edit update destroy]

  def index
    @search     = Facility.ransack(params[:q])
    @facilities = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @facility = Facility.new
  end

  def edit; end

  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      redirect_to @facility, notice: 'Facility was successfully created.'
    else
      render :new
    end
  end

  def update
    if @facility.update(facility_params)
      redirect_to @facility, notice: 'Facility was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @facility.destroy
    redirect_to countries_url, notice: 'Facility was successfully destroyed.'
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:package_id, :name, :description)
  end
end
