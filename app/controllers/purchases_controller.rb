class PurchasesController < ApplicationController
  before_action :set_item, only: %i[create]

  def new
    @item = Item.find(1)
    @address = current_user.address.prefecture[:name] + current_user.address.city + current_user.address.house_number + current_user.address.building_name 
    @card = current_user.card
    @post_num_first = current_user.address.post_address.to_s.slice(0, 3)
    @post_num_last = current_user.address.post_address.to_s.slice(3, 7)
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    @address = current_user.address.prefecture[:name] + current_user.address.city + current_user.address.house_number + current_user.address.building_name
    @post_num_first = current_user.address.post_address.to_s.slice(0, 3)
    @post_num_last = current_user.address.post_address.to_s.slice(3, 7)
    @card = current_user.card
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_id,
        currency: 'jpy'
      )
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end