class FacilitiesController < ApplicationController
  before_action :set_facility, only: %i[show edit update destroy]

  # GET /countries
  # GET /countries.json
  def index
    @search = Facility.ransack(params[:q])
    @facilities = @search.result(distinct: true).page(params[:page]).per(15)
  end

  # GET /countries/1
  # GET /countries/1.json
  def show; end

  # GET /countries/new
  def new
    @facility = Facility.new
  end

  # GET /countries/1/edit
  def edit; end

  # POST /countries
  # POST /countries.json
  def create
    @facility = Facility.new(facility_params)

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_facility
    @facility = Facility.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def facility_params
    params.require(:facility).permit(:package_id, :name, :description)
  end
end
