class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]

  def index
    @search   = Policy.order(name: :asc).ransack(params[:q])
    @policies = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @policy = Policy.new
  end

  def edit; end

  def create
    @policy = Policy.new(policy_params)

    if @policy.save
      redirect_to @policy, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @policy.update(policy_params)
      redirect_to @policy, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @policy.destroy
    redirect_to policies_url, notice: t('.notice')
  end

  private

  def set_policy
    @policy = Policy.find(params[:id])
  end

  def policy_params
    params.require(:policy).permit(:package_id, :name, :description)
  end
end
