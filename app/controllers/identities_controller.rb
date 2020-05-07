class IdentitiesController < ApplicationController
  before_action :set_identity, only: %i[show edit update destroy]

  def index
    @search     = Identity.ransack(params[:q])
    @identities = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @identity = Identity.new
  end

  def edit; end

  def create
    @identity = Identity.new(identity_params)

    if @identity.save
      redirect_to @identity, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @identity.update(identity_params)
      redirect_to @identity, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @identity.destroy
    redirect_to identities_url, notice: t('.notice')
  end

  private

  def set_identity
    @identity = Identity.find(params[:id])
  end

  def identity_params
    params.require(:identity).permit(
      :nik, :full_name, :birth_place, :birth_date, :gender, :address, :hamlet,
      :neighbourhood, :urban_village, :sub_district, :district, :province_id,
      :city_id, :religion, :martial_status, :job, :nationality
    )
  end
end
