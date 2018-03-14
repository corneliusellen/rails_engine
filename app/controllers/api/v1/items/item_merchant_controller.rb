class Api::V1::Items::ItemMerchantController < ApplicationController
  def show
    render json: Item.find(params[:id]), serializer: ItemMerchantSerializer
  end
end