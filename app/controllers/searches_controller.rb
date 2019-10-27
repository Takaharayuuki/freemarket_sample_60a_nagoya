class SearchesController < ApplicationController
  def index
    @search_items = Item.order('created_at DESC').ransack(params[:q])
  end
end
