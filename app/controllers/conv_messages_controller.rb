class ConvMessagesController < ApplicationController
  before_action :set_conv_message, only: %i[ show edit update destroy ]

  # GET /conv_messages or /conv_messages.json
  def index
    @conv_messages = ConvMessage.all
  end

  # GET /conv_messages/1 or /conv_messages/1.json
  def show
  end

  # GET /conv_messages/new
  def new
    @conv_message = ConvMessage.new
  end

  # GET /conv_messages/1/edit
  def edit
  end

  # POST /conv_messages or /conv_messages.json
  def create
    @conv_message = ConvMessage.new(conv_message_params)

    respond_to do |format|
      if @conv_message.save
        format.html { redirect_to conv_message_url(@conv_message), notice: "Conv message was successfully created." }
        format.json { render :show, status: :created, location: @conv_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conv_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conv_messages/1 or /conv_messages/1.json
  def update
    respond_to do |format|
      if @conv_message.update(conv_message_params)
        format.html { redirect_to conv_message_url(@conv_message), notice: "Conv message was successfully updated." }
        format.json { render :show, status: :ok, location: @conv_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conv_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conv_messages/1 or /conv_messages/1.json
  def destroy
    @conv_message.destroy

    respond_to do |format|
      format.html { redirect_to conv_messages_url, notice: "Conv message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conv_message
      @conv_message = ConvMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conv_message_params
      params.require(:conv_message).permit(:conversation_id, :user, :message)
    end
end
