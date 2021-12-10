class SoldsController < ApplicationController
  before_action :authenticate_user!
  #TODO before_action :check_permission
  before_action :set_sold, only: %i[ show edit update destroy ]

  # GET /solds or /solds.json
  def index
    @solds = Sold.where(user_id: current_user.id)
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
end
