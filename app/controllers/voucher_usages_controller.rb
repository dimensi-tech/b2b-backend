class VoucherUsagesController < ApplicationController
  before_action :set_voucher_usage, only: %i[show edit update destroy]

  # GET /voucher_usages
  # GET /voucher_usages.json
  def index
    @search = VoucherUsage.ransack(params[:q])
    @voucher_usages = @search.result(distinct: true).includes(:customer, :voucher)
                             .page(params[:page]).per(15)
  end

  # GET /voucher_usages/1
  # GET /voucher_usages/1.json
  def show; end

  # GET /voucher_usages/new
  def new
    @travel_destination = VoucherUsage.new
  end

  # GET /voucher_usages/1/edit
  def edit; end

  # POST /voucher_usages
  # POST /voucher_usages.json
  def create
    @travel_destination = VoucherUsage.new(travel_destination_params)

    respond_to do |format|
      if @travel_destination.save
        format.html { redirect_to @travel_destination, notice: 'Travel destination was successfully created.' }
        format.json { render :show, status: :created, location: @travel_destination }
      else
        format.html { render :new }
        format.json { render json: @travel_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voucher_usages/1
  # PATCH/PUT /voucher_usages/1.json
  def update
    respond_to do |format|
      if @travel_destination.update(travel_destination_params)
        format.html { redirect_to @travel_destination, notice: 'Travel destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_destination }
      else
        format.html { render :edit }
        format.json { render json: @travel_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voucher_usages/1
  # DELETE /voucher_usages/1.json
  def destroy
    @travel_destination.destroy
    respond_to do |format|
      format.html { redirect_to voucher_usages_url, notice: 'Travel destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_voucher_usage
    @travel_destination = VoucherUsage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def travel_destination_params
    params.require(:travel_destination).permit(:country_id, :destination)
  end
end
