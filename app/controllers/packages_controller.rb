# frozen_string_literal: true

class PackagesController < ApplicationController
  before_action :set_package, only: %i[show edit update destroy]

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

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_package
    @package = Package.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def package_params
    params.require(:package).permit(:product_id, :name, :description, :price)
  end
end
