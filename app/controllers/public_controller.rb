class PublicController < ApplicationController
  before_action :get_seller_by_id
  
  def seller
  end

  private

  def get_seller_by_id
    @seller = User.find(params[:id])
  end


end
