class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
    @item = Item.new
    @item = Item.find(params[:item_id])

  end

  def create
    @record_address = RecordAddress.new(record_params)
    @item = Item.new
    @item = Item.find(params[:item_id])
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:post_number, :area_id, :city, :street_number, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end