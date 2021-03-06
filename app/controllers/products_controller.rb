class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    if current_user.role.name == 'Travel Agent'
      @search   = Product.where(travel_partner_id: current_user.travel_partner_id)
                         .order(name: :asc).ransack(params[:q])
      @products = @search.result(distinct: true).page(params[:page])
    elsif current_user.role.name == 'Admin'
      @search   = Product.order(name: :asc).ransack(params[:q])
      @products = @search.result(distinct: true).page(params[:page])
    end
  end

  def show
    @product_packages = @product.packages.order('id asc')
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: t('.notice')
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :image, :category_id, :travel_destination_id, :travel_partner_id
    )
  end
end
