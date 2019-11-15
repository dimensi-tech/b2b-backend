class IdentitiesController < ApplicationController
  before_action :set_identity, only: [:show, :edit, :update, :destroy]

  def index
    @search = Identity.ransack(params[:q])
    @identities = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show
  end

  def new
    @identity = Identity.new
  end

  def edit
  end

  def create
    @identity = Identity.new(identity_params)

    respond_to do |format|
      if @identity.save
        format.html { redirect_to @identity, notice: 'Identity was successfully created.' }
        format.json { render :show, status: :created, location: @identity }
      else
        format.html { render :new }
        format.json { render json: @identity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @identity.update(identity_params)
        format.html { redirect_to @identity, notice: 'Identity was successfully updated.' }
        format.json { render :show, status: :ok, location: @identity }
      else
        format.html { render :edit }
        format.json { render json: @identity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @identity.destroy
    respond_to do |format|
      format.html { redirect_to identities_url, notice: 'Identity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_identity
      @identity = Identity.find(params[:id])
    end

    def identity_params
      params.require(:identity).permit(:nik, :full_name, :birth_place, :birth_date, :gender, :address, :hamlet, :neighbourhood, :urban_village, :sub_district, :district, :province_id, :city_id, :religion, :martial_status, :job, :nationality)
    end
end
