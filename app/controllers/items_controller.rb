class ItemsController < ApplicationController
  require "payjp"

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    # binding.pry
    if @item.save
      render 'index'
    else
      render 'new'
    end
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
    params.require(:item).permit(:name, :price, :size, :condition, :delivery_fee, :shipping_method, :indication, :burden, :description, :user_id)
  end

end
