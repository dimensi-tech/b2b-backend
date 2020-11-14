# frozen_string_literal: true

class UserManagementsController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @search = UserManagement.ransack(params[:q])
    @user_managements = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @user = UserManagement.new
  end

  def edit; end

  def create
    @user = UserManagement.new(user_params)

    if @user.save
      redirect_to @user, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to user_managements_url, notice: t('.notice')
  end

    private

  def set_user
    @user = UserManagement.find(params[:id])
  end

  def user_params
    params.require(:user_management).permit(:name, :email, :password, :travel_partner_id)
  end
end
