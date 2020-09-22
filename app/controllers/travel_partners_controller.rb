class TravelPartnersController < ApplicationController
  before_action :set_travel_partner, only: [:show, :edit, :update, :destroy]

  # GET /travel_partners
  # GET /travel_partners.json
  def index
    @search              = TravelPartner.ransack(params[:q])
    @travel_destinations = @search.result(distinct: true).page(params[:page]).per(15)
  end

  # GET /travel_partners/1
  # GET /travel_partners/1.json
  def show
  end

  # GET /travel_partners/new
  def new
    @travel_partner = TravelPartner.new
  end

  # GET /travel_partners/1/edit
  def edit
  end

  # POST /travel_partners
  # POST /travel_partners.json
  def create
    @travel_partner = TravelPartner.new(travel_partner_params)

    respond_to do |format|
      if @travel_partner.save
        format.html { redirect_to @travel_partner, notice: 'Travel partner was successfully created.' }
        format.json { render :show, status: :created, location: @travel_partner }
      else
        format.html { render :new }
        format.json { render json: @travel_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_partners/1
  # PATCH/PUT /travel_partners/1.json
  def update
    respond_to do |format|
      if @travel_partner.update(travel_partner_params)
        format.html { redirect_to @travel_partner, notice: 'Travel partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_partner }
      else
        format.html { render :edit }
        format.json { render json: @travel_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_partners/1
  # DELETE /travel_partners/1.json
  def destroy
    @travel_partner.destroy
    respond_to do |format|
      format.html { redirect_to travel_partners_url, notice: 'Travel partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_partner
      @travel_partner = TravelPartner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_partner_params
      params.require(:travel_partner).permit(:name, :logo, :address, :description)
    end
end
