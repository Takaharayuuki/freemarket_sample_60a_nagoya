class ItemsController < ApplicationController
  require "payjp"

  def index
  end

  def new
    @prefecture = Prefecture.all
    @item = Item.new
  end

  def show
    @item = Item.first
  end

  def create
    # binding.pry
    Item.create(create_params)
    redirect_to :root
  end

  def confirm
  end

  def payment
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 300,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  private

  def create_params
    params.require(:item).permit(:name, :price, :condition, :delivery_fee, :shipping_method, :indication, :burden, :description, :user_id).merge(user_id: current_user.id)
  end

end
