class TermAgreementsController < ApplicationController
  before_action :set_term_agreement, only: %i[show edit update destroy]

  def index
    @search          = TermAgreement.ransack(params[:q])
    @term_agreements = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show; end

  def new
    @term_agreement = TermAgreement.new
  end

  def edit; end

  def create
    @term_agreement = TermAgreement.new(term_agreement_params)

    if @term_agreement.save
      redirect_to @term_agreement, notice: 'Term agreement was successfully created.'
    else
      render :new
    end
  end

  def update
    if @term_agreement.update(term_agreement_params)
      redirect_to @term_agreement, notice: 'Term agreement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @term_agreement.destroy
    redirect_to term_agreements_url, notice: 'Term agreement was successfully destroyed.'
  end

  private

  def set_term_agreement
    @term_agreement = TermAgreement.find(params[:id])
  end

  def term_agreement_params
    params.require(:term_agreement).permit(:name, :description)
  end
end
