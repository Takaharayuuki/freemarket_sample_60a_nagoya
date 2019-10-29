class SearchesController < ApplicationController

  def index
    if params[:q].blank?
      redirect_to root_path
    elsif params[:q][:name_cont].blank?
      @key_word = ""
      @items = Item.where(name: @key_word).page(params[:page]).per(4)
    else
      display_number = 4
      @key_word = params[:q][:name_cont]
      @search_items = Item.order('created_at DESC').ransack(params[:q])
      @items = @search_items.result.page(params[:page]).per(display_number)
      
      page = if params[:page] == 1
                params[:page]
              elsif params[:page].present?
                params[:page]
              else
                "1"
              end
      @prev_items = if page.to_i == 1
                      page.to_i
                    else
                      (page.to_i - 1) * display_number
                    end
      @items_count = if @prev_items == 1
                        @items.count
                      else
                        @prev_items + @items.count
                      end 
    end
  end
  
end
