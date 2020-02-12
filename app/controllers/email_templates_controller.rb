class EmailTemplatesController < ApplicationController
  before_action :set_email_template, only: %i[show edit update destroy]

  def index
    @search          = EmailTemplate.order(name: :asc).ransack(params[:q])
    @email_templates = @search.result(distinct: true).page(params[:page])
  end

  def show; end

  def new
    @email_template = EmailTemplate.new
  end

  def edit; end

  def create
    @email_template = EmailTemplate.new(email_template_params)

    if @email_template.save
      redirect_to @email_template, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @email_template.update(email_template_params)
      redirect_to @email_template, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @email_template.destroy
    redirect_to email_templates_url, notice: t('.notice')
  end

  private

  def set_email_template
    @email_template = EmailTemplate.find(params[:id])
  end

  def email_template_params
    params.require(:email_template).permit(
      :name, :body, :template_type, :attachment_file, :status
    )
  end
end
