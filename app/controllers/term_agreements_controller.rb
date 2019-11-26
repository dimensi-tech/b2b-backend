class TermAgreementsController < ApplicationController
  before_action :set_term_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @search = TermAgreement.ransack(params[:q])
    @term_agreements = @search.result(distinct: true).page(params[:page]).per(15)
  end

  def show
  end

  def new
    @term_agreement = TermAgreement.new
  end

  def edit
  end

  def create
    @term_agreement = TermAgreement.new(term_agreement_params)

    respond_to do |format|
      if @term_agreement.save
        format.html { redirect_to @term_agreement, notice: 'Term agreement was successfully created.' }
        format.json { render :show, status: :created, location: @term_agreement }
      else
        format.html { render :new }
        format.json { render json: @term_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @term_agreement.update(term_agreement_params)
        format.html { redirect_to @term_agreement, notice: 'Term agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @term_agreement }
      else
        format.html { render :edit }
        format.json { render json: @term_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @term_agreement.destroy
    respond_to do |format|
      format.html { redirect_to term_agreements_url, notice: 'Term agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_term_agreement
      @term_agreement = TermAgreement.find(params[:id])
    end

    def term_agreement_params
      params.require(:term_agreement).permit(:name, :description)
    end
end
