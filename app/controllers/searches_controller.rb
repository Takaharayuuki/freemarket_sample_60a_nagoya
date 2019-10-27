class SearchesController < ApplicationController
  def index
    if params[:q].blank?
      redirect_to root_path
    else
      @key_word = params[:q][:name_cont]
      @search_items = Item.order('created_at DESC').ransack(params[:q])
      @items = @search_items.result
    end
  end
end
