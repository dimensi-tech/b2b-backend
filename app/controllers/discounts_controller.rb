class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[show edit update destroy]

  def index
    @search    = Discount.order(percentage: :asc).ransack(params[:q])
    @discounts = @search.result(distinct: true).page(params[:page])
  end

  def show; end

  def new
    @discount = Discount.new
  end

  def edit; end

  def create
    @discount = Discount.new(discount_params)

    if @discount.save
      redirect_to @discount, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @discount.update(discount_params)
      redirect_to @discount, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @discount.destroy
    redirect_to discounts_url, notice: t('.notice')
  end

  private

  def set_discount
    @discount = Discount.find(params[:id])
  end

  def discount_params
    params.require(:discount).permit(:name, :percentage, :status, :start_date, :end_date)
  end
end
