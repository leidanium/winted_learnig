class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit update destroy ]
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :is_ours, only: %i[edit destroy]
  before_action :set_categories, only: %i[new edit]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        manage_category
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        manage_category
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:name, :price, :desc, :sold, :categories, :condition, 
                                      images: [])
    end

    def is_ours
      if @article.user_id != current_user.id
        redirect_to root_path, alert: "Action non autoris??"
      end
    end

    def set_categories
      @categories = Category.all
    end

    def manage_category
      categories = Category.where(id: params[:article][:categories_ids])
      # byebug
      categories.each do |c|
        @article.categories << c
      end

      @article.save
      
    end
end
