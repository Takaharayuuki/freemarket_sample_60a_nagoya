class SearchesController < ApplicationController

  def index
    if params[:q].blank?
      redirect_to root_path
    elsif params[:q][:name_cont].blank?
      @key_word = ""
      @items = Item.where(name: @key_word).page(params[:page]).per(4)
    else
      @key_word = params[:q][:name_cont]
      @search_items = Item.order('created_at DESC').ransack(params[:q])
      @items = @search_items.result.page(params[:page]).per(4)
    end
  end
  
end