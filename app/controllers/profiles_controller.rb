class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @search   = Profile.ransack(params[:q])
    @profiles = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: t('.notice')
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(
      :user_id, :identity_id, :passport_id, :avatar, :telephone_number, :phone_number
    )
  end
end
