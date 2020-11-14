# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :set_role, only: %i[show edit update destroy]

  def index
    @search = Role.ransack(params[:q])
    @roles  = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        redirect_to roles_url, notice: t('.notice')
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @role.update(role_params)
        redirect_to roles_url, notice: t('.notice')
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_url, notice: t('.notice')
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name)
  end
end
