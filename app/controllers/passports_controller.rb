# frozen_string_literal: true

class PassportsController < ApplicationController
  before_action :set_passport, only: %i[show edit update destroy]

  def index
    @passports = Passport.all.page(params[:page]).per(15)
  end

  def show; end

  def new
    @passport = Passport.new
  end

  def edit; end

  def create
    @passport = Passport.new(passport_params)

    respond_to do |format|
      if @passport.save
        format.html { redirect_to @passport, notice: 'Passport was successfully created.' }
        format.json { render :show, status: :created, location: @passport }
      else
        format.html { render :new }
        format.json { render json: @passport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @passport.update(passport_params)
        format.html { redirect_to @passport, notice: 'Passport was successfully updated.' }
        format.json { render :show, status: :ok, location: @passport }
      else
        format.html { render :edit }
        format.json { render json: @passport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @passport.destroy
    respond_to do |format|
      format.html { redirect_to passports_url, notice: 'Passport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_passport
    @passport = Passport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def passport_params
    params.require(:passport).permit(:full_name, :birth_place, :mother_name, :father_name, :number, :expired_date, :birth_date, :identity_id)
  end
end
