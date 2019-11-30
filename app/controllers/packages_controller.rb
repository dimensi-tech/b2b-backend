# frozen_string_literal: true

class PackagesController < ApplicationController
  before_action :set_package, only: %i[show edit update destroy]
  before_action :check_product_id, only: %i[new edit]

  def index
    @search = Package.ransack(params[:q])
    @packages = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @package = Package.new
  end

  def edit; end

  def create
    @package = Package.new(package_params)
    @package.available_date = params.dig(:package, :available_date).split(', ')
    respond_to do |format|
      if @package.save
        format.html { redirect_to product_path(@package.product_id), notice: 'Package was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      params[:package][:available_date] = params.dig(:package, :available_date).split(', ')
      if @package.update(package_params)
        format.html { redirect_to product_path(@package.product_id), notice: 'Package was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to product_path(params[:product_id]), notice: 'Package was successfully destroyed.' }
    end
  end

  private

  def set_package
    @package = Package.find(params[:id])
  end

  def check_product_id
    redirect_to products_path if params[:product_id].blank?
  end

  def package_params
    params.require(:package).permit(
      :product_id, :name, :description, :price, :min_person, :max_person,
      :down_payment, :duration_trip, available_date: [],
      package_details_attributes: %i[_destroy id day description image]
    )
  end
end
