class CountriesController < ApplicationController
  before_action :set_country, only: %i[show edit update destroy]

  def index
    @search    = Country.ransack(params[:q])
    @countries = @search.result(distinct: true).page(params[:page])
  end

  def show; end

  def new
    @country = Country.new
  end

  def edit; end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to @country, notice: t('.notice')
      render :show, status: :created, location: @country
    else
      render :new
    end
  end

  def update
    if @country.update(country_params)
      redirect_to @country, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_url, notice: t('.notice')
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :code)
  end
end
