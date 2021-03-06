# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show]

  def index
    @search    = Customer.ransack(params[:q])
    @customers = @search.result(distinct: true).page(params[:page])
  end

  def show; end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
