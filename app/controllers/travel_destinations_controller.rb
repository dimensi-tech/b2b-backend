class TravelDestinationsController < ApplicationController
  before_action :set_travel_destination, only: %i[show edit update destroy]

  def index
    @search              = TravelDestination.ransack(params[:q])
    @travel_destinations = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @travel_destination = TravelDestination.new
  end

  def edit; end

  def create
    @travel_destination = TravelDestination.new(travel_destination_params)

    if @travel_destination.save
      redirect_to @travel_destination, notice: 'Travel destination was successfully created.'
    else
      render :new
    end
  end

  def update
    if @travel_destination.update(travel_destination_params)
      redirect_to @travel_destination, notice: 'Travel destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @travel_destination.destroy
    redirect_to travel_destinations_url, notice: 'Travel destination was successfully destroyed.'
  end

  private

  def set_travel_destination
    @travel_destination = TravelDestination.find(params[:id])
  end

  def travel_destination_params
    params.require(:travel_destination).permit(:country_id, :destination, :image)
  end
end
