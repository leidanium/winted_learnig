class SoldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sold, only: %i[ show edit update destroy accept refuse]
  before_action :check_permission, only: %i[accept refuse]

  # GET /solds or /solds.json
  def index
    @solds = Sold.includes(:article).where(user_id: current_user.id)
  end

  def sell_index
    my_articles_ids = current_user.articles.ids
    @solds = Sold.includes(:article).where(article_id: my_articles_ids)
  end

  # GET /solds/1 or /solds/1.json
  def show
  end

  # GET /solds/new
  def new
    @sold = Sold.new()
  end

  # GET /solds/1/edit
  def edit
  end

  # POST /solds or /solds.json
  def create
    @sold = Sold.new(sold_params)

    respond_to do |format|
      if @sold.save
        format.html { redirect_to @sold, notice: "Sold was successfully created." }
        format.json { render :show, status: :created, location: @sold }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solds/1 or /solds/1.json
  def update
    respond_to do |format|
      if @sold.update(sold_params)
        format.html { redirect_to @sold, notice: "Sold was successfully updated." }
        format.json { render :show, status: :ok, location: @sold }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solds/1 or /solds/1.json
  def destroy
    @sold.destroy
    respond_to do |format|
      format.html { redirect_to solds_url, notice: "Sold was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sold_proposal
    @sold = Sold.new(sold_proposal_params)
    @sold.user_id = current_user.id

    respond_to do |format|
      if @sold.save
        format.html { redirect_to solds_path, notice: "Sold Proposal was successfully created." }
        format.json { render :show, status: :created, location: @sold }
      else
        format.html { render articles_path, status: :unprocessable_entity }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    @sold.accept = true
    close_sold

    respond_to do |format|
      if @sold.save
        acceptance_propagate
        format.html { redirect_to sell_index_solds_path, notice: "La vente a bien ete accepté" }
        format.json { render :show, status: :created, location: @sold }
      else
        format.html { render sell_index_solds_path, status: :unprocessable_entity }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  def refuse
    @sold.accept = false
    close_sold

    respond_to do |format|
      if @sold.save
        format.html { redirect_to sell_index_solds_path, notice: "La refus a bien ete appliqué" }
        format.json { render :show, status: :created, location: @sold }
      else
        format.html { render sell_index_solds_path, status: :unprocessable_entity }
        format.json { render json: @sold.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sold
      @sold = Sold.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sold_params
      params.require(:sold).permit(:article_id, :user_id, :price, :closed)
    end

    def sold_proposal_params
      params.permit(:article_id)
    end

    def check_permission
      # byebug
      if current_user.id != @sold&.article&.user_id
        redirect_to sell_index_solds_path, alert: "Action non autorisé"
      end
    end

    def close_sold
      @sold.closed = true
    end

    def acceptance_propagate
      update_article_sold
      other_solds = Sold.where(article_id: @sold.article_id).where.not(id: @sold.id)
      other_solds.update_all(closed: true, accept: false)
    end

    def update_article_sold
      article = @sold.article.update(sold: true)
    end
end
