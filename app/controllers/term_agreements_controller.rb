class TermAgreementsController < ApplicationController
  before_action :set_term_agreement, only: [:show, :edit, :update, :destroy]

  # GET /term_agreements
  # GET /term_agreements.json
  def index
    @term_agreements = TermAgreement.all
  end

  # GET /term_agreements/1
  # GET /term_agreements/1.json
  def show
  end

  # GET /term_agreements/new
  def new
    @term_agreement = TermAgreement.new
  end

  # GET /term_agreements/1/edit
  def edit
  end

  # POST /term_agreements
  # POST /term_agreements.json
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

  # PATCH/PUT /term_agreements/1
  # PATCH/PUT /term_agreements/1.json
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

  # DELETE /term_agreements/1
  # DELETE /term_agreements/1.json
  def destroy
    @term_agreement.destroy
    respond_to do |format|
      format.html { redirect_to term_agreements_url, notice: 'Term agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term_agreement
      @term_agreement = TermAgreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_agreement_params
      params.require(:term_agreement).permit(:name, :description)
    end
end
