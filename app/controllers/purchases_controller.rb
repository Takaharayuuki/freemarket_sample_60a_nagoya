class PurchasesController < ApplicationController

  def new
    @item = Item.find(1)
    @address = current_user.address
    @card = current_user.card
    @post_num_first = @address.post_address.to_s.slice(0, 3)
    @post_num_second = @address.post_address.to_s.slice(3, 7)
    if @card
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    @card = current_user.card
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 300,
      customer: @card.customer_id,
      currency: 'jpy'
    )
  end

end