class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @search     = Category.ransack(params[:q])
    @categories = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: t('.notice')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :code, :description)
  end
end
