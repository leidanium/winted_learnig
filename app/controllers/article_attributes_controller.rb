class ArticleAttributesController < ApplicationController
  before_action :set_article_attribute, only: %i[ show edit update destroy ]

  # GET /article_attributes or /article_attributes.json
  def index
    @article_attributes = ArticleAttribute.all
  end

  # GET /article_attributes/1 or /article_attributes/1.json
  def show
  end

  # GET /article_attributes/new
  def new
    @article_attribute = ArticleAttribute.new
  end

  # GET /article_attributes/1/edit
  def edit
  end

  # POST /article_attributes or /article_attributes.json
  def create
    @article_attribute = ArticleAttribute.new(article_attribute_params)

    respond_to do |format|
      if @article_attribute.save
        format.html { redirect_to @article_attribute, notice: "Article attribute was successfully created." }
        format.json { render :show, status: :created, location: @article_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_attributes/1 or /article_attributes/1.json
  def update
    respond_to do |format|
      if @article_attribute.update(article_attribute_params)
        format.html { redirect_to @article_attribute, notice: "Article attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @article_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_attributes/1 or /article_attributes/1.json
  def destroy
    @article_attribute.destroy
    respond_to do |format|
      format.html { redirect_to article_attributes_url, notice: "Article attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_attribute
      @article_attribute = ArticleAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_attribute_params
      params.require(:article_attribute).permit(:value, :references)
    end
end
