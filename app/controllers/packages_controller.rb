# frozen_string_literal: true

class PackagesController < ApplicationController
  before_action :set_package, only: %i[show edit update destroy]
  before_action :check_product_id, only: %i[new edit]

  def index
    @search   = Package.ransack(params[:q])
    @packages = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @package = Package.new
  end

  def edit; end

  def create
    @package                = Package.new(package_params)
    @package.available_date = params.dig(:package, :available_date).split(', ')

    if @package.save
      redirect_to product_path(@package.product_id), notice: t('.notice')
    else
      render :new
    end

    @package.assigned_down_payment
  end

  def update
    params[:package][:available_date] = params.dig(:package, :available_date).split(', ')

    if @package.update(package_params)
      redirect_to product_path(@package.product_id), notice: t('.notice')
    else
      render :edit
    end

    @package.assigned_down_payment
  end

  def destroy
    @package.destroy
    redirect_to product_path(params[:product_id]), notice: t('.notice')
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
      :product_id, :name, :description, :price, :min_adult, :max_adult, :min_child,
      :max_child, :adult_price, :child_price, :down_payment, :duration_trip, :is_saving,
      :down_payment_flat, :down_payment_percentage, :down_payment_type, available_date: [],
      facilities_attributes: %i[_destroy id package_id name description],
      policies_attributes: %i[_destroy id package_id name description],
      package_details_attributes: %i[_destroy id package_id day description image],
      saving_packages_attributes: %i[_destroy id package_id sort adult_amount child_amount]
    )
  end
end
