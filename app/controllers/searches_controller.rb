class SearchesController < ApplicationController
  def index
    @key_word = params[:q][:name_cont]
    @search_items = Item.order('created_at DESC').ransack(params[:q])
    @items = @search_items.result
  end
end
