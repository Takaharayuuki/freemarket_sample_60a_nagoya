class ItemsController < ApplicationController
  require "payjp"

  def index
    @items = Item.order("created_at DESC").limit(15)
  end

  def new
    @item = Item.new
    @item_image = @item.images.build
    @prefecture = Prefecture.all
    @category_parent_array = ["---"]
    @category = Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def show
    @item = Item.first
  end

  def create
    # binding.pry
    @item = Item.new(create_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render :new
    end
  end

  def category_menu_children
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def create_params
    params.require(:item).permit(:name, :price, :condition, :category_id, :delivery_fee, :shipping_method, :indication, :burden, :description, :user_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
