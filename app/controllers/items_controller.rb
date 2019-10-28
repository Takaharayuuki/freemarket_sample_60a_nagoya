class ItemsController < ApplicationController
  before_action :category_parent_array, only: %i[new create edit update]
  before_action :redirect_to_login_form_unless_signed_in, only: %i[new]
  require "payjp"

  def index
    @items = Item.order('created_at DESC').limit(15)
  end

  def new
    @item = Item.new
    @image = @item.images.build
    @prefecture = Prefecture.all
    @category = Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def show
    @item = Item.find(params[:id])
    @seller = @item.saler
    @images = @item.images
    @other_items = Item.where(user_id: @item.user.id).where.not(id: @item.id ).order('id DESC').limit(6)
    @address = @item.user.address.prefecture[:name]
  end

  def create
    @item = Item.new(create_params)
    category = Category.find_by(name: params[:category_id])
    @item[:category_id] = category.id
    @item[:saler_id] = current_user.id
    if @item.save
      params[:item]['image'].each do |i|
        @image = @item.images.create!(image: i)
      end
      redirect_to controller: :items, action: :index
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
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

  def category_parent_array
    @category_parent_array = ["---"]
  end

  private

  def create_params
    params.require(:item).permit(:name, :price, :size, :condition, :shipping_method, :indication, :burden, :description, :category_id, :brand, :delivery_area, :user_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

end