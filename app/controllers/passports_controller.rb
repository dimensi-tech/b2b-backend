class PassportsController < ApplicationController
  before_action :set_passport, only: %i[show edit update destroy]

  def index
    @search    = Passport.ransack(params[:q])
    @passports = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @passport = Passport.new
  end

  def edit; end

  def create
    @passport = Passport.new(passport_params)

    if @passport.save
      redirect_to @passport, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @passport.update(passport_params)
      redirect_to @passport, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @passport.destroy
    redirect_to passports_url, notice: t('.notice')
  end

  private

  def set_passport
    @passport = Passport.find(params[:id])
  end

  def passport_params
    params.require(:passport).permit(
      :full_name, :birth_place, :mother_name, :father_name, :number, :expired_date,
      :birth_date, :identity_id
    )
  end
end
