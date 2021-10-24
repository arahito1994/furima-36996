class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
  end

  private

  def item_params
    params.require(:item).permit(:image)
  end


end
